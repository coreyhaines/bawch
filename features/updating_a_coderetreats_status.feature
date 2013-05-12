Feature: Updating the status of a coderetreat

  Scenario: Starting a session
    Given a coderetreat that has not started
    When I start the coderetreat
    And I go to the running coderetreats display page
    Then I should see that the coderetreat is in session

  Scenario: Starting a break
    Given a coderetreat that is in session
    When I start a break for the coderetreat
    And I go to the running coderetreats display page
    Then I should see that the coderetreat is on break
