Feature: Addition
  In order to avoid silly mistakes
  As a math idiot
	I want to be told the sum of two numbers

Background:
		Given I have cleared the calculator
@now
  Scenario: Add two numbers
    Given I have entered 50 into the calculator
    And I have entered 70 into the calculator
    When I press add
    Then the result should be 120 on the screen

  Scenario: No Step
    Given I don't have this step
    And I don't have another step
    When I shouldn't have this step
    Then I definitely won't have this step
