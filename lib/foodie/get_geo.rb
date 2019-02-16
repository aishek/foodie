# frozen_string_literal: true

#
# Return geo info by IP in JSON format.
#
#     Foodie::GetGeo.details('134.234.3.2') # { 'country' => 'Russia', ... }
#     Foodie::GetGeo.details                # similar info, but for current IP
#
module Foodie::GetGeo
  def self.details(ip: nil, provider: IpApiProvider)
    provider.details(ip)
  end
end
