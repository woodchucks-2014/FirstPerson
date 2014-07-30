module BuildHashHelper

  def imager(style)
    case style
    when "default"
      return "http://img3.wikia.nocookie.net/__cb20120626061259/secretworld/images/d/d2/Mission-action.png"
    when "completed checkpoint"
    when "checkpoint"
    when "quest"
    when "completed quest"
    when "checkin"
    end
  end

  def build_quests_hash(quests, style = "default")
    img_url = imager(style)
    Gmaps4rails.build_markers(quests) do |quest, marker|
      marker.lat quest.locations.first.latitude
      marker.lng quest.locations.first.longitude
      marker.picture({
        url: img_url,
        width:  36,
        height: 36
      })
      if quest.users.any? {|user| user.id==current_user.id}
        marker.infowindow "<iframe src='/already?quest_id=#{quest.id}' style='scrolling=no;'></iframe>"
      else
        marker.infowindow "<iframe src='/accept?quest_id=#{quest.id}' style='scrolling=no;'></iframe>"
      end
    end
  end

  def build_checkpoints_hash(checkins, style = "default")
    img_url = imager(style)
    checkins = checkins.map {|checkin| checkin.location}
    Gmaps4rails.build_markers(checkins) do |checkin, marker|
      marker.lat checkin.latitude
      marker.lng checkin.longitude
      marker.picture({
        url: img_url,
        width:  36,
        height: 36
      })
      marker.infowindow checkin.address
    end
  end

end
