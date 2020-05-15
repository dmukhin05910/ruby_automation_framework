require './service/models/objects/httpbin/base_httpbin'
require './service/models/objects/httpbin/post/role'

module Service::Models::Objects::Httpbin
  class Actor < BaseHttpbin

    attribute :name, String
    attribute :year, Integer
    attribute :actors, Role
    attribute :owner_id, Integer
    attribute :movie_type_id, Integer

    def self.builder
      return Actor::Builder.new
    end

    def self.from_json(json)
      return super(Actor, json)
    end

    class Builder
      def initialize
        @actor = Actor.new
      end

      def with_name(name)
        @actor.name = name
        return self
      end

      def with_year(year)
        @actor.year = year
        return self
      end

      def with_actors(actors)
        @actor.actors = actors
        return self
      end

      def with_owner_id(owner_id)
        @actor.owner_id = owner_id
        return self
      end

      def with_movie_type_id(movie_type_id)
        @actor.movie_type_id = movie_type_id
        return self
      end

      def build
        return @actor
      end
    end
  end
end
