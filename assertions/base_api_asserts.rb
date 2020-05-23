require './assertions/base_assert'

module Assertions
  #Base API asserts class which contains base API tests asserts templates
  class BaseApiAsserts < BaseAssert

    #Set Response object for verifying
    # @see Service::Models::Objects module
    def initialize(response)
      @response = response
    end

    #Verify is field value have UUID format
    # @param expected_string [String] verified field value
    # @param attribute [String] verified field name
    def verify_uuid_format(expected_string, attribute)
      $logger.info("Verifying \"#{attribute}\" value [#{expected_string}] is UUID")
      verify_regex(expected_string, /^[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}$/i, attribute)
    end

    #Verify JSON objects
    # @param expected_json [Service::Models::Objects] verified json object
    # @param json_name [String] verified json name
    def verify_json_equally(expected_json, json_name)
      @expected_pretty = JSON.pretty_generate(expected_json.as_json)
      @actual_pretty = JSON.pretty_generate(@response.as_json)
      $logger.info("Verifying JSONs \"#{json_name}\" equality")
      verify_object_equals(@expected_pretty, @actual_pretty, json_name)
    end
  end
end

