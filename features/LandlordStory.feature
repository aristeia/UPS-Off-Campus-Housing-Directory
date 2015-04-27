Feature: As a student
	So that I can see the landlords and thier information
	I want a list of landlords and their information

Scenario: See the information and simple navigation from homepage
	Given I am on the Housing Search page
	And I follow "Landlords"
	Then I should be on the Landlords page
	And I should see "Name"
	And I should see "Email"
	And I should see "Phone"
	And I should see "Rating"