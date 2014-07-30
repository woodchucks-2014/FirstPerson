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

  def info(mark)
    if mark.class == Quest
      if mark.users.any? {|user| user.id==current_user.id}
        return "<iframe src='/already?quest_id=#{mark.id}' style='scrolling=no;'></iframe>"
      else
        return "<iframe src='/accept?quest_id=#{mark.id}' style='scrolling=no;'></iframe>"
      end
    else
      return mark.location.address
    end
  end

  def build_markers(checkins, style = "default")
    img_url = imager(style)
    Gmaps4rails.build_markers(checkins) do |checkin, marker|
      marker.lat checkin.location.latitude
      marker.lng checkin.location.longitude
      marker.picture({
        url: img_url,
        width:  36,
        height: 36
      })
      marker.infowindow info(checkin)
    end
  end

end
