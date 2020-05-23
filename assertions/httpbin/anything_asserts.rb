module Assertions
  module Httpbin
    class AnythingAsserts < BaseApiAsserts
      def initialize(response)
        super(response)
      end

      def verify_actors(expected_payload)
        verify_json_equally(expected_payload, "Actors")
      end
    end
  end
end