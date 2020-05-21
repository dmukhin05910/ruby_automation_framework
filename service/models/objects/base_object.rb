require 'virtus'
require 'oj'

module Service
  module Models
    module Objects
      class BaseObject
        include Virtus

        def self.from_json(clazz, json)
          @json = Oj.load(json)
          if (@json.instance_of?(Array))
            @array = Array.new
            @json.each { |object| @array.push(clazz.new(object)) }
            return @array
          else
            return clazz.new(@json)
          end
        end
      end
    end
  end
end