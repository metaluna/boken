Feature: Log out user
    Background: Authenticated
        Given I am logged in as a user

    # 80% successful flow
    Scenario: Successful logout
        When I log out
        Then a success message is displayed
        And I am no longer logged in

    Scenario: Log out when user is not logged in
        Given I am not logged in
        When I log out
        Then I am redirected to the homepage

