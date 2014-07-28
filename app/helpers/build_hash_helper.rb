module BuildHashHelper

  def build_hash(quests)
      Gmaps4rails.build_markers(@quests) do |quest, marker|
        if quest.checkpoints.length >= 1 # Why are we doing this twice?
          marker.lat quest.checkpoints.first.location.latitude
          marker.lng quest.checkpoints.first.location.longitude
          marker.infowindow "<iframe src='/accept?quest_id=#{quest.id}' style='scrolling=no;'></iframe>"
        end
    end
  end
end
