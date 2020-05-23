#Initialize all available API asserts
Before('@api_case') do |scenario|
  $httpbin_asserts = Assertions::Httpbin::HttpbinAsserts.new
  $logger.info("API_SCENARIO: \"#{scenario.name}\"")
end