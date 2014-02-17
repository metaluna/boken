Feature: Register user
    Background: Unauthenticated
        Given I am not logged in

    # HAPPY HAPPY 80% sunshine
    Scenario: Register with complete data
        When I register with complete data
        Then a welcome message is displayed

    Scenario: Register without username
        When I try to register without a username
        Then an error message is displayed

    Scenario: Register without email
        When I try to register without an email
        Then an error message is displayed
        
    Scenario: Register without password
        When I try to register without a password
        Then an error message is displayed

    Scenario: Register without password confirmation
        When I try to register without a password confirmation
        Then an error message is displayed

    Scenario: Register with password confirmation mismatch
        When I try to register with non-matching password confirmation
        Then an error message is displayed

    Scenario: Register with invalid email address format
        When I try to register with an invalid email address format
        Then an error message is displayed

    Scenario: Register while logged in
        Given I am logged in as a user
        When I try to go to the registration page
        Then an error message about being already signed in is displayed
        And I am redirected to the homepage

    Scenario: Register with existing username
        When I try to register with an existing username
        Then an error message is displayed

    Scenario: Register with existing email address
        When I try to register with an existing email address
        Then an error message is displayed

