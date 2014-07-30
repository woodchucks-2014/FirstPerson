module CheckInsHelper

  def calc_distance(lat1, long1, lat2, long2)
      distance = Haversine.distance(lat1, long1, lat2, long2).to_meters
      return distance < 1 ? 1 : distance
  end

  def distance_since_last_checkin
    checkins = self.user.check_ins.order("created_at DESC").limit(2).map {|checkin| checkin.location}
    if checkins.length == 2
      return calc_distance(checkins[0].latitude, checkins[0].longitude, checkins[1].latitude, checkins[1].longitude)
    else
      return 1
    end
  end

  def check_in_xp
    distance = distance_since_last_checkin
    xp = 10 + distance/5000 * Math.log2(distance)
    user = User.find(self.user_id)
    user.total_xp += xp.floor
    self.xp = xp.floor
    self.save
    user.save
  end
end
