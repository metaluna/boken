Feature: Login user
    Background: Unauthenticated
        Given I am not logged in

    Scenario: Login with wrong password
        Given a user exists
        When I enter the wrong password
        Then an error message about wrong credentials is displayed 

   Scenario: Login with non-existing username
        When I enter an invalid username
        Then an error message about wrong credentials is displayed

   Scenario: Login with valid credentials
        Given a user exists
        When I enter the correct credentials
        Then a welcome message is displayed

