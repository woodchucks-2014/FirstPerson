module AuthHelper

 def oauth_client
    @client ||= OAuth2::Client.new(
      ENV['CLIENT_ID'],
      ENV['CLIENT_SECRET'],
      site: 'https://foursquare.com',
      token_url: '/oauth2/access_token',
      authorize_url: "/oauth2/authenticate"
      )
end

def auth_uri
   oauth_client.auth_code.authorize_url(
    :redirect_uri => 'http://' + request.host + ':3000' + '/redirect', # <-- your redirect URI
    #:scope => 'profile' # <-- determined by reading the Google OAuth2 docs
    )
 end

 def token_receipt
 oauth_client.auth_code.get_token(
  params[:code],
  client_id: ENV['CLIENT_ID'],
  client_secret: ENV['CLIENT_SECRET'],
  redirect_uri: 'http://' + request.host + ':3000' + '/redirect'
  )
 end

end
