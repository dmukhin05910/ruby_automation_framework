Feature: GET

  Background: Get REST Client
    Given Httpbin API

  @herokuapp @api_case
  Scenario: Retrieve UUID
    When I send get request to /uuid path
    Then Responce should have UUID format