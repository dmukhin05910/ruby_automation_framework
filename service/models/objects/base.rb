require 'virtus'
require 'oj'

module Service
  module Models
    #A Data Transfer Object(DTO) is an object which is used to encapsulate data.
    #It is commonly used in the Services layer which request data from third party API, or from the system itself.
    #The benefit of DTOs is to convert the raw data in an object and reduce unnecessary information.
    #It also makes a great model in MVC.
    #Moreover, DTO makes the code very easy to maintain and test.
    module Objects
      class Base
        include Virtus

        #Parse JSON to Object
        #@param clazz[Class] parsed class
        #@param json [JSON] parsed JSON object
        #@return [Class] parsed from JSON Object
        def self.from_json(clazz, json)
          return clazz.new(Oj.load(json))
        end
      end
    end
  end
end