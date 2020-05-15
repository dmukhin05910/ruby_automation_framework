Feature: Add_Remove page

  Background: Open Add/Remove Elements page
    Given I am on the Herokuapp search page
    When I am going to Add/Remove Elements page

  @herokuapp @ui_case
  Scenario: Header case
    Then The Add/Remove Elements page title should have "The Internet"
    And The Add/Remove Elements Header should have "Add/Remove Elements"

  @herokuapp @ui_case
  Scenario: Add case
    And I click Add element button 1 times
    Then Elements count should be 1

  @herokuapp @ui_case
  Scenario Outline: Add_Remove case
    And I click Add element button <add_click_count> times
    And I click Remove element button <remove_click_count> times
    Then Elements count should be <element_count>
    Examples:
      | add_click_count | remove_click_count | element_count |
      | 1               | 1                  | 0             |
      | 2               | 1                  | 1             |