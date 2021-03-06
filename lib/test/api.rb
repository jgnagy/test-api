require 'sinatra'
require 'jsonapi-serializers'
require 'sinatra/jsonapi'

module Test
  module API
    class Service < Sinatra::Base
      register Sinatra::JSONAPI

      namespace '/bar' do
        get '/baz' do
          serialize_models [TestKey.find(11), TestKey.find(12)]
        end
      end

      resource :testkeys do
        helpers do
          def find(id)
            TestKey.find(Integer(id)) if id.to_s.match /[0-9]+/
          end
        end

        get '/foo' do
          serialize_models [TestKey.find(98), TestKey.find(99)]
        end

        show do
          last_modified resource.created_at
          next resource
        end

        create do |_attributes|
          key = TestKey.new(rand(1..9))
          next [key.id, key]
        end
      end
    end
  end
end

class TestKey
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

class TestKeySerializer
  include JSONAPI::Serializer

  def type
    'testkeys'
  end

  attribute :name
  attribute :created_at
end
