module Assertions
  module Httpbin
    #Navigation class for Httpbin tests asserts
    class HttpbinAsserts
      #Asserts for /uuid Httpbin endpoint tests
      def get_uuid_asserts(responce)
        return GetUUIDAsserts.new(responce)
      end

      #Asserts for /anything Httpbin endpoint tests
      def anything_asserts(responce)
        return AnythingAsserts.new(responce)
      end
    end
  end
end