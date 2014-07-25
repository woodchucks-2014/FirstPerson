module CheckInsHelper

  def calc_distance(lat1, long1, lat2, long2)
    Haversine.distance(lat1, long1, lat2, long2).to_meters
  end

  def distance_since_last_checkin(user)
    locations = user.checkins.order("created_at DESC").first(2)
    calc_distance(locations[0].latitude, locations[0].longitude, locations[1].latitude, locations[1].longitude)
  end

  def check_in_xp(user)
    distance = calc_distance(user)
    xp = distance/1000 * Math.log2(distance) # xp scales as O(n*log(n)), because why not?
    user.total_xp += xp
  end

end