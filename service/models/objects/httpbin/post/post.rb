require './service/models/objects/httpbin/base_httpbin'
require_all './service/models/objects/httpbin/post'

module Service::Models::Objects::Httpbin
  class Post < BaseHttpbin

    attribute :args, PostArgs
    attribute :data, String
    attribute :files, PostFiles
    attribute :form, PostForm
    attribute :headers, PostHeaders
    attribute :json, Actor
    attribute :method, String
    attribute :origin, String
    attribute :url, String

    def self.from_json(json)
      @json = json.gsub! '-', '_'
      super(Post, @json)
    end
  end
end