module GHClient
  class User
    def self.path user_name
      "/users/#{user_name}"
    end

    def self.repositories_path user_name
      "/users/#{user_name}/repos"
    end
  end
end