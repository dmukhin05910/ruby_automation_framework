require './assertions/base_assert'

module Assertions
  class BaseApiAsserts < BaseAssert

    def initialize(response)
      @response = response
    end

    def verify_uuid_format(expected_string, attribute)
      $logger.info("Verifying \"#{attribute}\" value [#{expected_string}] is UUID")
      verify_regex(expected_string, /^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$/i, attribute)
    end

    def verify_json_equally(expected_json, json_name)
      @expected_pretty = JSON.pretty_generate(expected_json.as_json)
      @actual_pretty = JSON.pretty_generate(@response.as_json)
      $logger.info("Verifying JSONs \"#{json_name}\" equality")
      verify_object_equals(@expected_pretty, @actual_pretty, json_name)
    end
  end
end

