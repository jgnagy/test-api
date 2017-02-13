require 'sinatra'
require 'jsonapi-serializers'
require 'sinatra/jsonapi'

module Test
  module API
    class Service < Sinatra::Base
      register Sinatra::JSONAPI

      resource :keys do
        helpers do
          def find(id)
            Key.find(id.to_i)
          end
        end

        show do
          last_modified resource.created_at
          next resource
        end

        create do |_attributes|
          key = Key.new
          next key
        end
      end
    end
  end
end

class Key
  attr_accessor :name
  attr_reader :created_at

  def self.find(id)
    self.new(id)
  end

  def initialize(id)
    @id = id
    @name = "A Key"
    @created_at = Time.now
  end

  def id
    @id
  end
end

class KeySerializer
  include JSONAPI::Serializer

  attribute :name
  attribute :created_at
end
