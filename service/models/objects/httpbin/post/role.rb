require './service/models/objects/base_object'

module Service
  module Models
    module Objects
      module Httpbin
        class Role < BaseObject

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
    end
  end
end