Feature: Edit story
    Scenario: With valid values
        When I change the title
        Then the changed title is visible

    Scenario: Without a title
        When I delete the title
        Then an error message is visible

    Scenario: With an existing title
        Given a story exists
        When I change the title to one already existing
        Then an error message is visible
