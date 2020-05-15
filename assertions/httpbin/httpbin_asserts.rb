module Assertions
  module Httpbin
    class HttpbinAsserts
      def get_uuid_asserts(responce)
        return GetUUIDAsserts.new(responce)
      end

      def post_asserts(responce)
        return PostAsserts.new(responce)
      end
    end
  end
end