require 'singleton'
require 'net/https'
require 'json'

module GHClient
  class NoAccessToken < StandardError; end
  
  class Connection

    BASE_URL = 'https://api.github.com'
    ACCESS_TOKEN = '6afbf23e799a6d16d7a2cc69645307ea4a3a6c74'
    
    attr_reader :last_response

    def initialize options = {}
      @options = options
      options[:access_token] ||= ACCESS_TOKEN
      check_options!(@options)
    end

    def check_options!(options)
      options[:access_token] || (raise NoAccessToken)
    end

    def get path
      uri = URI(BASE_URL + path + "?access_token=#{@options[:access_token]}")
      response = Net::HTTP.get_response(uri)
      check_and_parse_response!(response)
    end

    def check_and_parse_response!(response)
      @last_response = response
      JSON.parse(response.body)
    end
  end
end