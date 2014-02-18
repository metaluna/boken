Feature: Show user information
    Background:
        Given a user named "Bob" exists

    Scenario: Display stories created by user
        Given a user named "Bob" has created the story "Bob's Adventure"
        When I look at the user page of "Bob"
        Then I should see "Bob's Adventure"

    Scenario: Display finished games by user
        Given a story named "Peanut Farm" exists
        And a user named "Bob" has finished the story "Peanut Farm"
        When I look at the user page of "Bob"
        Then I should see "Peanut Farm"
    
    Scenario: Display own saved games
        Given I am logged in as a user
        And a story named "Resumable Adventure" exists
        When I start a new game of "Resumable Adventure"
        And I look at my user page
        Then I should see "Resumable Adventure"
    
    Scenario: Do not display saved games of others
        Given a story named "Resumable Adventure" exists
        And a user named "Alice" exists
        And a user named "Alice" started playing "Resumable Adventure"
        When I look at the user page of "Alice"
        Then I should not see "Resumable Adventure"
        