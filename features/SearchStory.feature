Feature: As a student
	So that I can find the house I want
	I want to search all listings for a house

Scenario: Search the database
  Given I am on the Housing Search page
  When I check "Laundry"
  Then I should be on the Housing Search page
    But I should see "Laundry"

