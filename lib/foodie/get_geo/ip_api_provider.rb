# frozen_string_literal: true

require 'open-uri'
require 'json'

#
# ip-api.com provider for Foodie::GetGeo
#
module Foodie::GetGeo::IpApiProvider
  class << self
    def call(ip = nil)
      open("http://ip-api.com/json/#{ip}") do |f|
        response = f.read
        JSON.parse(response)
      end
    end
  end
end
