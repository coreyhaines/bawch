Given /^there are no coderetreats running today$/ do
  Coderetreat.destroy_all
end

Given /^there are some coderetreats running today$/ do
  @coderetreats = [
    Coderetreat.create!(status: "not_started", location: "Chicago"),
    Coderetreat.create!(status: "not_started", location: "Seattle"),
    Coderetreat.create!(status: "in_session",  location:"Berlin")
  ]
end

When /^I go to the running coderetreats display page$/ do
  visit running_today_coderetreats_url
end

Then /^I should see that there are no coderetreats running$/ do
  page.should have_content("There are no coderetreats running today")
end

Then /^I should see the running coderetreats grouped by status$/ do
  @coderetreats.each do |coderetreat|
    within(".#{coderetreat.status}") do
      page.should have_css(".coderetreat", text: coderetreat.location)
    end
  end
end

Given(/^a coderetreat that has not started$/) do
  @coderetreat = Coderetreat.create! status: "not_started", location: "Chicago"
end

When(/^I start the coderetreat$/) do
  visit edit_status_coderetreat_url(@coderetreat)
  click_on "Start Session"
end

Then(/^I should see that the coderetreat is in session$/) do
  page.should have_css(".in_session .coderetreat", text: @coderetreat.location)
end

