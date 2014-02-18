Feature: Delete a story
    Scenario: Delete story successfully
        Given I am logged in as a user
        And a story exists
        When I delete the story
        Then the story is not visible