# frozen_string_literal: true

require 'test_helper'
require 'geo/test_provider'

class GeoTest < Minitest::Test
  def subject(ip = nil)
    Foodie::Geo.new(Foodie::Geo::TestProvider).get_details_by_ip(ip)
  end

  def test_it_respond_with_ip_info_on_ip_passed
    assert do
      subject('134.234.3.2') == {
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

  def test_it_respond_with_current_ip_info_on_no_ip_passed
    assert do
      subject == {
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
  end

  def test_it_respond_with_error_info_on_not_an_ip_passed
    assert_raises Foodie::Geo::GetDetailsFailedError do
      subject('wtf')
    end
  end
end
