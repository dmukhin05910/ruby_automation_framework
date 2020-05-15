When(/^I send get request to \/uuid path$/) do
  @response = @httpbin_endpoint.get_uuid
end

And('Responce should have UUID format') do
  @uuid_asserts = $httpbin_asserts.get_uuid_asserts(@response)
  @uuid_asserts.verify_uuid
end