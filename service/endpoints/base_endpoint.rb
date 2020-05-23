require 'faraday'

module Service
  #Endpoints module designed to delegate the technical part of the code to understandable business methods
  #What makes our API calls clearer for future development and reduces code duplication
  module Endpoints
    #Base endpoints class which contains Faraday initializing and base API calls with responce code checking
    class BaseEndpoint
      #Initialize Faraday and set logger for API calls
      # @param baseURI [String] base API URI
      def initialize(baseURI)
        @rest_client = Faraday.new(baseURI, headers: {"Content-Type" => "application/json"}) do |c|
          c.use Faraday::Request::UrlEncoded
          c.response :logger, $logger, bodies: true
          c.adapter Faraday.default_adapter
        end
      end

      #GET API call
      # @param path [String] endpoint path
      # @param expected_code [Integer] expected response code
      # @param params [Hash] json request params
      # @param additional_headers [Hash] json request headers
      def get(path, expected_code, params = nil, additional_headers = nil)
        @response = @rest_client.get(path) do |req|
          req.params = params if params
          req.headers = additional_headers if additional_headers
        end
        validate_response_code(@response, expected_code)
        return @response
      end

      #POST API call
      # @param path [String] endpoint path
      # @param payload [JSON] request json body
      # @param expected_code [Integer] expected response code
      # @param params [Hash] json request params
      # @param additional_headers [Hash] json request headers
      def post(path, payload, expected_code, params = nil, additional_headers = nil)
        @response = @rest_client.post(path) do |req|
          req.body = payload
          req.params = params if params
          req.headers = additional_headers if additional_headers
        end
        validate_response_code(@response, expected_code)
        return @response
      end

      #PUT API call
      # @param path [String] endpoint path
      # @param payload [JSON] request json body
      # @param expected_code [Integer] expected response code
      # @param params [Hash] json request params
      # @param additional_headers [Hash] json request headers
      def put(path, payload, expected_code, params = nil, additional_headers = {})
        @response = @rest_client.put(path) do |req|
          req.body = payload
          req.params = params if params
          req.headers = additional_headers if additional_headers
        end
        validate_response_code(@response, expected_code)
        return @response
      end

      #DELETE API call
      # @param path [String] endpoint path
      # @param expected_code [Integer] expected response code
      # @param params [Hash] json request params
      # @param additional_headers [Hash] json request headers
      def delete(path, expected_code, params = nil, additional_headers = {})
        @response = @rest_client.delete(path) do |req|
          req.params = params if params
          req.headers = additional_headers if additional_headers
        end
        validate_response_code(@response, expected_code)
        return @response
      end

      #Validate json response code
      # @param response [JSON] API call response
      # @param code [Integer] expected response code for checking
      def validate_response_code(response, code)
        @code = response.status
        raise "Unexpected status code. Expect #{code} but was #{@code}" unless @code.equal?(code)
      end
    end
  end
end