module BuildHashHelper

  def build_quest_hash(quests)
    Gmaps4rails.build_markers(quests) do |quest, marker|
      if quest.checkpoints.length >= 1
        marker.lat quest.checkpoints.first.location.latitude
        marker.lng quest.checkpoints.first.location.longitude
        marker.infowindow "<iframe src='/accept?quest_id=#{quest.id}' style='scrolling=no;'></iframe>"
      end
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
