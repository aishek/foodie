# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'foodie/geo/get_details_failed_error'

#
# ip-api.com provider for Foodie::Geo
#
module Foodie::Geo::IpApiProvider
  class << self
    def get_details_by_ip(ip)
      address = "http://ip-api.com/json/#{ip}"
      uri = URI.parse(address)

      open(uri) do |f| # rubocop:disable Security/Open
        response = f.read
        JSON.parse(response)
      end
    end
  end
end
