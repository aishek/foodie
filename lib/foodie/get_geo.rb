# frozen_string_literal: true

require 'forwardable'

#
# Return geo info by IP in JSON format.
#
#     Foodie::GetGeo.call('134.234.3.2') # { 'country' => 'United States', ... }
#     Foodie::GetGeo.call                # similar info, but for current IP
#
class Foodie::GetGeo
  extend Forwardable

  def_delegators :@provider, :call

  def initialize(provider = IpApiProvider)
    @provider = provider
    freeze
  end

  def self.call(ip = nil)
    new.call(ip)
  end
end
