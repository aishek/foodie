# frozen_string_literal: true

require 'open-uri'
require 'json'
require 'foodie/geo/get_details_failed_error'

#
# ip-api.com provider for Foodie::GetGeo
#
module Foodie::Geo::IpApiProvider
  class << self
    def details(ip = nil)
      open("http://ip-api.com/json/#{ip}") do |f|
        response = f.read
        JSON.parse(response).tap do |result|
          raise Foodie::Geo::GetDetailsFailedError if result['status'] == 'fail'
        end
      end
    end
  end
end
