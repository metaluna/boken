Feature: Create story
   Scenario: List new story on homepage
      When I create a new story
      Then the story is listed on the homepage

   Scenario: Without a title
      When I create a new story without a title
      Then an error message is visible