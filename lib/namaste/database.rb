require 'namaste/config'

require 'dm-core'

module Namaste
  module Database
    # Default configuration of the database
    DEFAULT_CONFIG = {
      :adapter => :sqlite3,
      :database => ':memory'
    }

    #
    # Returns +true+ if the Database is setup, returns +false+ otherwise.
    #
    def Database.setup?
      repository = DataMapper.repository

      return repository.class.adapters.has_key?(repository.name)
    end

    #
    # Call the given _block_ then update the Database.
    #
    def Database.update!(&block)
      block.call if block

      DataMapper.auto_upgrade! if Database.setup?
      return nil
    end

    #
    # Sets up the Database with the given _configuration_. If
    # _configuration is not given, +DEFAULT_CONFIG+ will be used to setup
    # the Database.
    #
    def Database.setup(configuration=DEFAULT_CONFIG,&block)
      # setup the database repository
      DataMapper.setup(:default, configuration)

      Database.update!(&block)
      return nil
    end
  end
end
