# coding: utf-8
require 'net/http'
require 'net/https'
require 'uri'
require 'json'

class EmailProcessor
    def initialize(email)
      @email = email
    end

    def process
      Rails.logger.debug(ENV['YNABIT_API_URL'])
      uri = URI.parse(ENV['YNABIT_API_URL'])

      header = { 'Content-Type' =>'application/json' }
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = { text: @email.body }.to_json
      http.request(request)
    end
end
