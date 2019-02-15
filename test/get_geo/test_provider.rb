# frozen_string_literal: true

require 'ipaddr'

module Foodie::GetGeo::TestProvider
  class << self
    def call(ip = nil)
      case ip
      when '134.234.3.2' then remote1_info
      when nil then self_info
      else
        return error unless ipv4?(ip)

        raise NotImplemented
      end
    end

    private

    def ipv4?(ip)
      IPAddr.new(ip)
      true
    rescue StandardError
      false
    end

    def error
      {
        'message' => 'invalid query',
        'query' => 'wtf',
        'status' => 'fail'
      }
    end

    def self_info
      {
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
      }
    end

    def remote1_info
      {
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
      }
    end
  end
end