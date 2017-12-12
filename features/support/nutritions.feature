Feature: display the nutrition page

  As a user on the nutrition page
  I want to see the nutrition page content
  So that I can navigate the application

Background: Calorie intake in database

  Given the following calories exist:
  | height          | weight        | age |
  | 70              | 150           | 21  |

  
Scenario: Showing collection of recommended food groups
    Given I am on the nutrition page
    Then I should see "Protein" and "Fats"
  
Scenario: Showing collection of recommended calorie intakes
    Background: Calorie intake in database
    Given I am on the nutrition page
    Then I should see "1011.25"
    
Scenario: Deleting a single calorie output
    Background: Calorie intake in the database
    Given I am on the show nutrition page
    And I press the "Delete" button
    Then I should not see "1011.25"
    
Scenario: Successfully updating a single calorie output
    Background: Calorie intake in the database
    Given I am on the show nutrition page
    And I press "Edit"
    And I fill in "height (inches)" with "80"
    When I press the "Update Nutrition Information" button
    Then I should see "80" and "1170"
    
Scenario: Adding calorie intake
    Given I am on the nutrition page
    When I press "Add New Info"
    And I fill in "height (inches)" with "x"
    And I fill in "weight (pounds)" with "y"
    When I press the "Save Information" button
    Then I should see "x" and "y"