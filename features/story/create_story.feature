Feature: Create story
   Scenario: Visitors cannot create stories
      Given I am not logged in
      When I go to the new story page
      Then I should see the login page

   Scenario: List new story on homepage
      Given I am logged in as a user
      When I create a new story
      Then the story is listed on the homepage

   Scenario: Without a title
      Given I am logged in as a user
      When I create a new story without a title
      Then an error message is visible