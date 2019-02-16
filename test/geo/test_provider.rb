# frozen_string_literal: true

require 'ipaddr'
require 'foodie/geo/get_details_failed_error'

module Foodie::Geo::TestProvider
  Result = Struct.new(:read)

  class << self
    def call(ip = nil)
      yield(result(ip))
    end

    private

    def result(ip)
      case ip
      when '134.234.3.2' then remote1_info
      when nil then self_info
      else
        return error unless ipv4?(ip)

        raise NotImplementedError
      end
    end

    def ipv4?(ip)
      IPAddr.new(ip)
      true
    rescue StandardError
      false
    end

    def error
      Result.new('{"message":"invalid query","query":"www","status":"fail"}')
    end

    def self_info
      Result.new({
        'as' => 'AS12714 Net By Net Holding LLC',
        'city' => 'Tver',
        'country' => 'Russia',
        'countryCode' => 'RU',
        'isp' => 'TI-BB',
        'lat' => 56.8605,
        'lon' => 35.876,
        'org' => 'Net By Net Holding LLC',
        'query' => '79.111.140.156',
        'region' => 'TVE',
        'regionName' => 'Tver’ Oblast',
        'status' => 'success',
        'timezone' => 'Europe/Moscow',
        'zip' => '170042'
      }.to_json)
    end

    def remote1_info
      Result.new({
        'as' => 'AS1586 DoD Network Information Center',
        'city' => 'Sierra Vista',
        'country' => 'United States',
        'countryCode' => 'US',
        'isp' => 'DoD Network Information Center',
        'lat' => 31.5552,
        'lon' => -110.35,
        'org' => 'USAISC',
        'query' => '134.234.3.2',
        'region' => 'AZ',
        'regionName' => 'Arizona',
        'status' => 'success',
        'timezone' => 'America/Phoenix',
        'zip' => '85613'
      }.to_json)
    end
  end
end
