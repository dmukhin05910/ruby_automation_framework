require './service/models/objects/httpbin/base_httpbin'

module Service::Models::Objects::Httpbin
  class UUID < BaseHttpbin
    attribute :uuid, String

    def self.from_json(json)
      return super(UUID, json)
    end
  end
end