# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'foodie/geo/get_details_failed_error'

#
# ip-api.com provider for Foodie::Geo
#
module Foodie::Geo::IpApiProvider
  class << self
    def call(ip)
      address = "http://ip-api.com/json/#{ip}"
      open(address) do |f| # rubocop:disable Security/Open
        yield f
      end
    end
  end
end
