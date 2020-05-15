require './assertions/base_assert'

module Assertions
  module Herokuapp
    class AddRemoveElementsAsserts < BaseUIAsserts

      attr_accessor :add_remove_page

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

      def verify_delete_elements_count(expect_count)
        verify_object_equals(expect_count, @page.get_delete_elements_count, "Delete buttons count")
      end
    end
  end
end
