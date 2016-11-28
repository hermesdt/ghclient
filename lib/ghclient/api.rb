require_relative './connection'
require_relative './user'
require_relative './repository'
require_relative './cli'

module GHClient
  class Api

    attr_accessor :connection

    def initialize connection = GHClient::Connection.new()
      @connection = connection
    end

    def get_user user_name
      @connection.get GHClient::User.path(user_name)
    end

    def get_repositories user_name
      @connection.get GHClient::User.repositories_path(user_name)
    end

    def get_languages_for_repository(repository)
      @connection.get GHClient::Repository.languages_path(repository)
    end
  end
end
