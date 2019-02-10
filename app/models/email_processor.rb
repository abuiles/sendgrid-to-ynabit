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
      uri = URI.parse(ENV['YNABIT_API_URL'])

      header = { 'Content-Type' =>'application/json' }
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true if uri.port == 443
      request = Net::HTTP::Post.new(uri.request_uri, header)
      body = { text: @email.body, bcc: @email.bcc.first }

      request.body = body.to_json
      Rails.logger.debug(body)
      http.request(request)
    end
end
