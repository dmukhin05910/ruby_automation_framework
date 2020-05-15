require './assertions/base_assert'

module Assertions
  class BaseUIAsserts < BaseAssert

    def initialize(page)
      @page = page
    end

    def verify_title(expected_title)
      $logger.info("Verifying \"Page title\" is [#{expected_title}]")
      verify_object_equals(expected_title, @page.get_title, "Page title")
    end
  end
end