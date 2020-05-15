require 'virtus'
require 'oj'

module Service
  module Models
    module Objects
      class Base
        include Virtus

        def self.from_json(clazz, json)
          return clazz.new(Oj.load(json))
        end
      end
    end
  end
end