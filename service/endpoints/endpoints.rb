module Service
  module Endpoints
    #Navigation class.
    class Endpoints

      # Initialize httpbin endpoint object
      def httpbin_endpoint
        return Httpbin::HttpbinEndpoint.new
      end
    end
  end
end