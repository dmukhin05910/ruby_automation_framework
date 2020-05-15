require './assertions/base_assert'

module Assertions
  module Herokuapp
    class ABTestingAsserts < BaseUIAsserts

      attr_accessor :a_b_page

      def initialize(page)
        super(page)
      end
      #
      # def verify_title(expect_title)
      #   verify_title(expect_title)
      # end

      def verify_header(expect_header)
        verify_object_equals(expect_header, @page.get_header, "Page header")
      end
    end
  end
end