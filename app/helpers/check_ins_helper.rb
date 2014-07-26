module CheckInsHelper

  def calc_distance(lat1, long1, lat2, long2)
    Haversine.distance(lat1, long1, lat2, long2).to_meters
  end

  def distance_since_last_checkin
    locations = self.user.check_ins.order("created_at DESC").limit(2)
    if locations.length == 2
      return calc_distance(locations[0].location.latitude, locations[0].location.longitude, locations[1].location.latitude, locations[1].location.longitude)
    else
      return 0
    end
  end

  def check_in_xp
    distance = distance_since_last_checkin
    # I think we should award a set amount of xp for checking in at a new location and then a bonus for distance. That way someone can't level up a ridiculous about just by checking in twice at super distant locations
    xp = 10 + distance/5000 * Math.log2(distance) # xp scales as O(n*log(n)), because why not?
    self.user.total_xp += xp
  end

  def time_since_last_checkin
    t = Chronic.Span.new
    t.begin = self.user.check_ins.order("created_at DESC").first.created_at
    t.end = time.now
    t.width
  end

end
