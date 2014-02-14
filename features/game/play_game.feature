Feature: Play a game
    Background: 
        Given a story with scenes exists

    Scenario: Start a new game
        When I start a new game
        Then the first scene of the story is shown
        And there is an input field for my commands
 