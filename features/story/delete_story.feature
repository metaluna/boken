Feature: Delete a story
    Scenario: Delete story successfully
        Given a story exists
        When I delete the story
        Then the story is not visible