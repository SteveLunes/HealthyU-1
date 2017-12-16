Feature: display the about us page with title

  As a developer
  I want to add an about us page
  So that I can give a description of each developer
    
  Scenario: Title present
    Given I am on the aboutus page
    Then I should see the title "About Us"