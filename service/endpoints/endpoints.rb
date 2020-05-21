module Service
  module Endpoints
    class Endpoints

      def httpbin_endpoint
        return Httpbin::HttpbinEndpoint.new
      end

      def test_rail_endpoint(project)
        return TestRail::TestRailEndpoint.new(project)
      end
    end
  end
end