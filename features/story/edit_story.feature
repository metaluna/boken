Feature: Edit story
    Scenario: With valid values
        Given I am logged in as a user
        And a story authored by me exists
        When I change the title
        Then the changed title is visible

    Scenario: Without a title
        Given I am logged in as a user
        And a story authored by me exists
        When I delete the title
        Then an error message is visible

    Scenario: With an existing title
        Given I am logged in as a user
        And a story authored by me exists
        When I change the title to one already existing
        Then an error message is visible
