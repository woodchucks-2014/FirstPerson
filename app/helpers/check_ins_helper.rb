module CheckInsHelper

  def calc_distance(lat1, long1, lat2, long2)
    Haversine.distance(lat1, long1, lat2, long2).to_meters
  end

  def distance_since_last_checkin
    checkins = self.user.check_ins.order("created_at DESC").limit(2).map {|checkin| checkin.location}
    if checkins.length == 2
      return calc_distance(checkins[0].latitude, checkins[0].longitude, checkins[1].latitude, checkins[1].longitude)
    else
      return 0
    end
  end

  def check_in_xp
    distance = distance_since_last_checkin
    xp = 10 + distance/5000 * Math.log2(distance) # xp scales as O(n*log(n)), because why not?
    user = self.user
    user.total_xp += xp
    self.xp = xp
    self.save
    user.save
  end

  def time_since_last_checkin
    t = Chronic.Span.new
    t.begin = self.user.check_ins.order("created_at DESC").first.created_at
    t.end = time.now
    t.width
  end

end
