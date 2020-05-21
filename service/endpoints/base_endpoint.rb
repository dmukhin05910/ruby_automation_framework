require 'faraday'

module Service
  module Endpoints
    class BaseEndpoint

      def initialize(baseURI)
        @rest_client = Faraday.new(baseURI, headers: {"Content-Type" => "application/json"}) do |c|
          c.use Faraday::Request::UrlEncoded
          c.response :logger, $logger, bodies: true
          c.adapter Faraday.default_adapter
        end
      end

      def get(path, expected_code, params = nil, additional_headers = nil)
        @response = @rest_client.get(path) do |req|
          req.params = params if params
          req.headers = additional_headers if additional_headers
        end
        validate_response_code(@response, expected_code)
        return @response
      end

      def post(path, payload, expected_code, params = nil, additional_headers = nil)
        @response = @rest_client.post(path) do |req|
          req.body = payload
          req.params = params if params
          req.headers = additional_headers if additional_headers
        end
        validate_response_code(@response, expected_code)
        return @response
      end

      def put(path, payload, expected_code, params = nil, additional_headers = {})
        @response = @rest_client.put(path) do |req|
          req.body = payload
          unless params.nil?
            req.params = params
          end
          req.headers = additional_headers
        end
        validate_response_code(@response, expected_code)
        return @response
      end

      def delete(path, expected_code, params = nil, additional_headers = {})
        @response = @rest_client.delete(path) do |req|
          unless params.nil?
            req.params = params
          end
          req.headers = additional_headers
        end
        validate_response_code(@response, expected_code)
        return @response
      end

      def validate_response_code(response, code)
        @code = response.status
        raise "Unexpected status code. Expect #{code} but was #{@code}" unless @code.equal?(code)
      end
    end
  end
end