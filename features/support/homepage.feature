Feature: display the homepage with title

  As a user opening the application
  I want to see the homepage
  So that I can navigate the application
  
  Scenario: Opening application
    Given I have not opened the application
    When I click on the link
    Then I should be on the homepage
    
  Scenario: Title present
    Given I am on the homepage
    When I look on the page 
    Then I should see the title "HealthyU"
    
    