module BuildHashHelper

  def imager(style)
    case style
    when "default"
      return "http://i.picresize.com/images/2014/07/30/v4U9Y.png"
    when "completed checkpoint"
      return "http://i.picresize.com/images/2014/07/30/5juv1.png"
    when "checkpoint"
      return "http://i.picresize.com/images/2014/07/30/v4U9Y.png"
    when "quest"
      return "http://i.picresize.com/images/2014/07/30/v4U9Y.png"
    when "completed quest"
      return "http://i.picresize.com/images/2014/07/30/5juv1.png"
    when "checkin"
      return "http://i.picresize.com/images/2014/07/30/v4U9Y.png"
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
