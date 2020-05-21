require './service/models/objects/base_object'
require './service/models/objects/test_rail/cases_steps'

module Service
  module Models
    module Objects
      module TestRail
        class Cases < BaseObject
          attribute :id, Integer
          attribute :title, String
          attribute :section_id, Integer
          attribute :template_id, Integer
          attribute :type_id, Integer
          attribute :priority_id, Integer
          attribute :milestone_id, Integer
          attribute :refs, String
          attribute :created_by, Integer
          attribute :created_on, Integer
          attribute :updated_by, Integer
          attribute :updated_on, Integer
          attribute :estimate, String
          attribute :estimate_forecast, String
          attribute :suite_id, Integer
          attribute :display_order, Integer
          attribute :custom_automation_type, Integer
          attribute :custom_preconds, String
          attribute :custom_steps, String
          attribute :custom_expected, String
          attribute :custom_steps_separated, Array(CasesSteps)
          attribute :custom_mission, String
          attribute :custom_goals, String

          def self.from_json(json)
            super(Cases, json)
          end
        end
      end
    end
  end
end
