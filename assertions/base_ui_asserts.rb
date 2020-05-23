require './assertions/base_assert'

module Assertions
  #Base UI asserts class which contains base UI tests asserts templates
  class BaseUIAsserts < BaseAssert

    #Set UI page for Asserting
    # @see pages module
    def initialize(page)
      @page = page
    end

    # Verifying page title
    # @param expected_title[String] expected page title
    def verify_title(expected_title)
      $logger.info("Verifying \"Page title\" is [#{expected_title}]")
      verify_object_equals(expected_title, @page.get_title, "Page title")
    end
  end
end