class QuestsController < ApplicationController

  def all
    @user_quest = UserQuest.new
    @quests = Quest.all.select { |quest| quest.checkpoints.length >= 1  }
    @hash = Gmaps4rails.build_markers(@quests) do |quest, marker|
      if quest.checkpoints.length >= 1
        marker.lat quest.checkpoints.first.location.latitude
        marker.lng quest.checkpoints.first.location.longitude
        marker.infowindow "<iframe src='/accept?quest_id=#{quest.id}'></iframe>"
      end
    end
    render json: @hash
  end

  def accept_form
    @user_quest = UserQuest.new
    @quest = Quest.find(params[:quest_id])

  end

  def main
    @quests = Quest.all
    @user_quest = UserQuest.new
    @quest = Quest.new
  end


  def accept
    @user_quest = UserQuest.new(user_quest_params)

    if @user_quest.save
       redirect_to accepted_path
      flash[:notice] = "Quest successfully accepted"
    else
      flash[:notice] = "Please try again"
       redirect_to rejected_path
    end

  end


  def create
    @checkpoint = Checkpoint.new
    @quest = Quest.new(quest_params)
    if @quest.save
      render partial: 'quests/quest_loc'
    else
      flash[:notice] = "Please try again"
      render partial: 'quests/rejected'
    end

  end

  def set_location
    @location = Location.new
    @location.name = params[:checkpoint][:locations][:name]
    @location.street = params[:checkpoint][:locations][:street]
    @location.city = params[:checkpoint][:locations][:city]
    @location.state = params[:checkpoint][:locations][:state]
    @location.zip = params[:checkpoint][:locations][:zip]
    @location.save
    @location.save

    params[:checkpoint][:location_id] = @location.id

    @checkpoint = Checkpoint.new(checkpoint_params)
    if @checkpoint.save
      render "foursquare/search_venues"
      # flash[:notice] = "Quest successfully created"
    else
      flash[:notice] = "Please try again"
      redirect_to quests_path
    end

  end

  def get_location
    location = Location.new
    location.save
  end


  def accepted
  end

  def rejected
  end

  def search_venues
  query = @location.name
  ll = [@location.latitude, @location.longitude].join(',')
  api = Fsqr.new(session[:token])
  returned_venues = api.client.suggest_completion_venues(query: query, ll: ll)
  @venues = {}
  returned_venues["minivenues"].each do |venue|
    @venues[venue["name"]] =
                          {
                            name: venue["name"],
                            venue_type: venue["categories"].first["name"],
                            second_type: venue["categories"].last["name"],
                            latitude: venue["location"]["lat"],
                            longitude:venue["location"]["lng"],
                            foursquare_id: venue["id"],
                            street: venue["location"]["address"],
                            city: venue["location"]["city"],
                            state: venue["location"]["state"],
                            zip: venue["location"]["postalCode"],
                            country: venue["location"]["country"]
                          }
                        end

  render json: @venues
end

  private

  def checkpoint_params
    params.require(:checkpoint).permit(:instructions, :quest_id, :location_id)
  end

  def user_quest_params
    params[:user_quest][:user_id] = 1#current_user2.id change for deployment
    params.require(:user_quest).permit(:user_id, :quest_id, :completed)
  end

  def quest_params
    params[:quest][:creator_id] = 1#current_user2.id change for deployment
    params.require(:quest).permit(:creator_id, :title, :description, :user_limit, :category, :end_date)
  end

end
