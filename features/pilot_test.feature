Feature: Pilot test
  In order to prove our worthiness
  As a offshore vendor
  I want to test the coupa AJAX application
  
  Scenario: login and check a few things as demo given
    Given I have a test browser running
    When I visit "https://priyatrunk.coupahost.com/user/home"
    And I fill in "user_login" with "priyauser"
    And I fill in "user_password" with "welcome"
    And I press the button
    Then I should see "Sign Out, My Account"
    When I mouseover navigation "Catalogs"
    And I follow "Amazon.com"
    And I submit the 1st product
    And I wait for popup "popOver"
    And I click link in "popOver"
    Then I should see "Take a Tour!"
    