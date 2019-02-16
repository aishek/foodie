# frozen_string_literal: true

#
# Return geo info by IP in JSON format.
#
#     Foodie::GetGeo.new.details('134.234.3.2') # { 'country' => 'Russia', ... }
#     Foodie::GetGeo.new.details                # similar info for current IP
#
class Foodie::GetGeo
  def initialize(provider = IpApiProvider)
    @provider = provider
  end

  def details(ip)
    @provider.details(ip)
  end
end
