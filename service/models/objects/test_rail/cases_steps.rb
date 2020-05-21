require './service/models/objects/base_object'

module Service
  module Models
    module Objects
      module TestRail
        class CasesSteps < BaseObject
          attribute :content, String
          attribute :expected, String
        end
      end
    end
  end
end