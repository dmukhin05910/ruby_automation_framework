require './service/models/objects/base_object'
require_all './service/models/objects/httpbin/post'

module Service
  module Models
    module Objects
      module Httpbin
        class Post < BaseObject


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
    end
  end
end