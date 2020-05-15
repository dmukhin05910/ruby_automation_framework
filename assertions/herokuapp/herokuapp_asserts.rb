module Assertions
  module Herokuapp
    class HerokuappAsserts

      def a_b_testing_asserts(a_b_page)
        return ABTestingAsserts.new(a_b_page)
      end

      def add_remove_elements_asserts(add_remove_page)
        return AddRemoveElementsAsserts.new(add_remove_page)
      end
    end
  end
end
