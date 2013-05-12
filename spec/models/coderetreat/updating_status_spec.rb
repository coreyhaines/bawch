require 'active_record_spec_helper'
require 'coderetreat'

describe "Updating the status" do
  it "updates the status" do
    coderetreat = Coderetreat.create! status: "not_started", location: "Chicago"

    coderetreat.update_status "in_session"
    coderetreat.reload
    expect(coderetreat.status).to eq("in_session")
  end
end
