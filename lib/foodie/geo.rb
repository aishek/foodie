# frozen_string_literal: true

#
# Return geo info by IP in JSON format.
#
#     Foodie::Geo.new.get_details_by_ip('134.234.3.2') # { 'country' => 'Russia', ... }
#     Foodie::Geo.new.get_details_by_ip                # similar info for current IP
#     Foodie::Geo.new.get_details_by_ip('here')        # raise GetDetailsFailedError
#
class Foodie::Geo
  def initialize(provider = IpApiProvider)
    @provider = provider
  end

  def get_details_by_ip(ip)
    @provider.get_details_by_ip(ip).tap do |details|
      raise Foodie::Geo::GetDetailsFailedError if details['status'] == 'fail'
    end
  end
end
