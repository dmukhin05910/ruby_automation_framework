require './service/models/objects/base_object'

module Service
  module Models
    module Objects
      module Httpbin
        class PostHeaders < BaseObject

          attribute :Accept, String
          attribute :Accept_Encoding, String
          attribute :Cache_Control, String
          attribute :Content_Length, String
          attribute :Content_Type, String
          attribute :Host, String
          attribute :Postman_Token, String
          attribute :User_Agent, String
          attribute :X_Amzn_Trace_Id, String
        end
      end
    end
  end
end