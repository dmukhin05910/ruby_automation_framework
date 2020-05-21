require './service/endpoints/base_endpoint'

module Service
  module Endpoints
    module TestRail
      class TestRailEndpoint < BaseEndpoint
        GET_CASES = "get_cases"
        GET_CASE = "get_case"


        def initialize(project)
          @configs = YAML.load(File.open("config/test_rail.yaml"))['projects'][project]
          super("#{@configs['uri']}").basic_auth(@configs['user'], @configs['password'])
        end

        def get_cases
          $logger.info('Getting test cases from /get_cases endpoint with expected code 200')
          response = get("/index.php?/api/v2/#{GET_CASES}/#{@configs['id']}", 200)
          return Models::Objects::TestRail::Cases.from_json(response.body)
        end
      end
    end
  end
end