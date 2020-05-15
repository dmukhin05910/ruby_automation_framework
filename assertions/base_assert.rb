require 'rspec'

module Assertions
  class BaseAssert
    include RSpec::Matchers

    def initialize
      #Init RSpec
      RSpec.configure do |config|
        config.expect_with :rspec do |c|
          c.syntax = :expect
        end
      end
    end

    def verify_object_equals(expected, actual, verified_attribute)
      $logger.info("Verifying \"#{verified_attribute}\" object: [#{expected}]\nequaling actual: [#{actual}]")
      expect(expected).to eql(actual), "\"#{verified_attribute}\" should be \"#{expected}\", but \"#{actual}\""
    end

    def verify_regex(expected, regex, verified_attribute)
      $logger.info("Verifying \"#{verified_attribute}\" object: [#{expected}]\nmatching regex: [#{regex}]")
      expect(expected).to match(regex), "\"#{verified_attribute}\" should match format \"#{regex}\", but \"#{expected}\""
    end
  end
end