module GHClient
  class Repository
    def self.languages_path repo
      "/repos/#{repo}/languages"
    end
  end
end