Feature: A_B testing page

  Background: Open A/B Elements page
    Given I am on the Herokuapp search page
    When I am going to A/B Testing page

  @herokuapp @ui_case
  Scenario: Header case
    Then The A/B testing page title should have "The Internet"
    And Header should have "A/B Test "