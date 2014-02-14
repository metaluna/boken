Feature: Edit story
    Background:
        Given a story exists
    Scenario: With valid values
        When I change the title
        Then the changed title is visible

    Scenario: Without a title
        When I delete the title
        Then an error message is visible

    Scenario: With an existing title
        When I change the title to one already existing
        Then an error message is visible
