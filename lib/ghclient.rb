class GHClient
  autoload :Client, 'ghclient/client'
  autoload :User, 'ghclient/user'
  autoload :Repository, 'ghclient/repository'

  attr_accessor :client

  def initialize
    @client = GHClient::Client.new()
  end

  def get_user user_name
    @client.get GHClient::User.path(user_name)
  end

  def get_repositories user_name
    @client.get GHClient::User.repositories_path(user_name)
  end

  def get_languages_for_repository(repository)
    @client.get GHClient::Repository.languages_path(repository)
  end

end
