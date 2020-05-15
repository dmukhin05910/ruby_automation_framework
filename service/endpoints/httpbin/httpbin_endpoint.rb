require './service/endpoints/base_endpoint'

module Service
  module Endpoints
    module Httpbin
      class HttpbinEndpoint < BaseEndpoint

        UUID_ENDPOINT = "uuid"
        ANYTHING_ENDPOINT = "anything"

        def initialize
          super("https://httpbin.org")
        end

        def get_uuid(expected_code=200)
          $logger.info("Getting uuid from /uuid endpoint with expected code #{expected_code}")
          response = get(UUID_ENDPOINT, expected_code)
          return Models::Objects::Httpbin::UUID.from_json(response.body)
        end

        def post_anything(payload, expected_code=200)
          $logger.info("Posting data to /anything endpoint with expected code #{expected_code}")
          response = post(ANYTHING_ENDPOINT, payload, expected_code)
          return Models::Objects::Httpbin::Post.from_json(response.body)
        end
      end
    end
  end
end