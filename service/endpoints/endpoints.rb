module Service
  module Endpoints
    class Endpoints

      def httpbin_endpoint
        return Httpbin::HttpbinEndpoint.new
      end
    end
  end
end