require './service/models/objects/httpbin/base_httpbin'

module Service::Models::Objects::Httpbin
  class PostHeaders < BaseHttpbin

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