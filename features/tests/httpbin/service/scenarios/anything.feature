Feature: POST

  Background: Get REST Client
    Given Httpbin API

  @herokuapp @api_case
    @TMS:
  Scenario Outline: Send Actor data to anything endpoint
    Given I have actors with <name> and <year>
    And Each actor have <role> and <numbers>
    When I send POST request to with created payload to /anything path
    Then Responce should have all data from payload
    Examples:
      | name | year | role      | numbers |
      | Jin  | 1995 | Some_Role | 1,2,3   |
      | Rin  | 1996 | Some_Role | 3,2,1   |