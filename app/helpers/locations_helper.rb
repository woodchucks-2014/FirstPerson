module LocationsHelper

  def calc_distance(lat1, long1, lat2, long2)
    Haversine.distance(lat1, long1, lat2, long2).to_meters
  end

end