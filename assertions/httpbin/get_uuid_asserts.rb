require './assertions/base_api_asserts'

module Assertions
  module Httpbin
    class GetUUIDAsserts < BaseApiAsserts

      def initialize(response)
        super(response)
      end

      def verify_uuid
        verify_uuid_format(@response.uuid, "UUID")
      end
    end
  end
end