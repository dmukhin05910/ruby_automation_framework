require './service/models/objects/base_object'

module Service
  module Models
    module Objects
      module Httpbin
        class UUID < BaseObject
          attribute :uuid, String

          def self.from_json(json)
            return super(UUID, json)
          end
        end
      end
    end
  end
end