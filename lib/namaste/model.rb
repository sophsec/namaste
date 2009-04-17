require 'dm-core'
require 'dm-types'
require 'dm-validations'

module Namaste
  module Model
    include DataMapper::Types

    def self.included(base)
      unless base.ancestors.include?(DataMapper::Resource)
        base.module_eval do
          include DataMapper::Resource
          include DataMapper::AutoMigrations
        end
      end
    end
  end
end
