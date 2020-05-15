require './service/models/objects/httpbin/base_httpbin'

module Service::Models::Objects::Httpbin
  class Role < BaseHttpbin

    attribute :role, String
    attribute :numbers, Array(Integer)

    def self.builder
      return Role::Builder.new
    end

    def self.from_json(json)
      return super(Role, json)
    end

    class Builder
      def initialize
        @role = Role.new
      end

      def with_role(role)
        @role.role = role
        return self
      end

      def with_numbers(numbers)
        @role.numbers = numbers
        return self
      end

      def build
        return @role
      end
    end
  end
end