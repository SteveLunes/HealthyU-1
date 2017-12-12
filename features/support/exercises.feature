Feature: display the exercise page

  As a user on the exercise page
  I want to see the exercise page content
  So that I can navigate the application


Background: Exercises in database

  Given the following exercises exist:
  | name              | muscle                    | description  |
  | Renee             | abs                       | crunches  |
  | Mukul             | biceps                    | curl ups  |
    
Scenario: Title present
  Given I am on the exercise page
  Then I should see the title "Exercises"
    
Scenario: Muscle links present
  Given I am on the exercise page
  When I click on the muscle link
  Then I should be on the exercises page
    
  # Scenario: Adding exercises
  #   Given I am on the exercise page
  #   When I press "Add New Exercise"
  #   And I fill in "muscle" with "abs"
  #   And I fill in "description" with "crunches"
  #   When I press the "Save Exercise" button
  #   Then I should see "abs" and "crunches"
    
Scenario: Editing exercises
  Background: Exercises in database
  Given I am on the show exercise page
  And I press "Edit"
  And I fill in "name" with "Nee"
  When I press the "Update Muscle Info" button
  And I should see "abs" and "crunches"
    
Scenario: Deleting exercises
  Background: Exercises in database
  Given I am on the show exercise page
  And I press the "Delete" button
  Then I should not see "abs"