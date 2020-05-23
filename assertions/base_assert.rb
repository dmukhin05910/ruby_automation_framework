require 'rspec'

#Assertion module designed to delegate the technical part of the code to understandable business methods
#What makes our assertions clearer for future development and reduces code duplication
module Assertions
  #Base assertion class which contains RSpec initializing and base assertion templates
  class BaseAssert
    include RSpec::Matchers

    #Base RSpec initializing
    def initialize
      RSpec.configure do |config|
        config.expect_with :rspec do |c|
          c.syntax = :expect
        end
      end
    end

    #Equals RSpec verifier template
    # @param expected [Object] expected object for comparing with expected
    # @param actual [Object] actual object for comparing with expected
    # @param verified_attribute [String] name of verifying object
    def verify_object_equals(expected, actual, verified_attribute)
      $logger.info("Verifying \"#{verified_attribute}\" object: [#{expected}]\nequaling actual: [#{actual}]")
      expect(expected).to eql(actual), "\"#{verified_attribute}\" should be \"#{expected}\", but \"#{actual}\""
    end

    #Match RSpec verifier template
    # @param expected [String] expected object for matching with regex
    # @param regex [Regexp] regex to matching expected string
    # @param verified_attribute [String] name of verifying object
    def verify_regex(expected, regex, verified_attribute)
      $logger.info("Verifying \"#{verified_attribute}\" object: [#{expected}]\nmatching regex: [#{regex}]")
      expect(expected).to match(regex), "\"#{verified_attribute}\" should match format \"#{regex}\", but \"#{expected}\""
    end
  end
end