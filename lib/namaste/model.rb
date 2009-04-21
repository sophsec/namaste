require 'dm-core'
require 'dm-types'
require 'dm-validations'

module Namaste
  module Model
    include DataMapper::Types

    # Name of the DataMapper repository
    REPOSITORY_NAME = :namaste

    def self.included(base)
      unless base.ancestors.include?(DataMapper::Resource)
        base.module_eval do
          include DataMapper::Resource
          include DataMapper::AutoMigrations

          def self.default_repository_name
            Model::REPOSITORY_NAME
          end
        end
      end
    end
  end
end
