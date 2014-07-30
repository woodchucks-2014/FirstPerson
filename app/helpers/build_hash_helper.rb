module BuildHashHelper

  def build_quests_hash(quests)
    Gmaps4rails.build_markers(quests) do |quest, marker|
      marker.lat quest.locations.first.latitude
      marker.lng quest.locations.first.longitude
      marker.infowindow "<iframe src='/accept?quest_id=#{quest.id}' style='scrolling=no;'></iframe>"
    end
  end

  def build_checkpoints_hash(checkins)
    checkins = checkins.map {|checkin| checkin.location}
    Gmaps4rails.build_markers(checkins) do |checkin, marker|
      marker.lat checkin.latitude
      marker.lng checkin.longitude
      marker.infowindow checkin.address
    end
  end

end
