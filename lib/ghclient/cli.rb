module GHClient
  class Cli
    attr_accessor :device

    def initialize api: GHClient::Api.new, device: STDOUT
      @device = device
      @api = api
    end

    def print_for_user user
      acum = Hash.new { |h, k| h[k] = 0}

      @api.get_repositories(user).each do |repo|
        languages = @api.get_languages_for_repository(repo["full_name"])
        languages.each{|l,c| acum[l] += c}
        print_repo_info(repo, languages)
      end

      first_language = acum.to_a.sort{|x,y| y[1] <=> x[1]}[0]
      puts "First language for #{user}: #{first_language[0]}"
    end

    def print_repo_info repo, languages
      total = languages.inject(0){|acum, l| acum + l[1]}
      puts "#{repo["full_name"]} - Total LOC: #{total}"

      languages.each do |language, count|
        print_progress(total, language, count)
      end
      puts ""
    end

    def print_progress total, text, size
      proportion = (size.to_f / total.to_f).round(2)
      characters = "="*(proportion * 20)
      empty_characters = " "*(20 - (proportion * 20).floor)
      puts "[" + characters + empty_characters + "] (#{(proportion * 100).round(2)}% / #{size} LOC) #{text}"
    end

    def puts message
      @device.puts message
    end
  end
end