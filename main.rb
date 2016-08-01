require 'rubygems'
require 'sinatra'
require 'omniauth'
require 'omniauth-discord'

use Rack::Session::Cookie
use OmniAuth::Builder do
  provider :discord, '209738337295138816', 'J2-U6wU2qjeL1K4lvJ13EY0UQHGxKlvl'
end

get '/' do
  <<-HTML
    <a href='/auth/discord'>Sign in with Discord</a>
  HTML
end

get '/auth/:name/callback' do
  auth = request.env['omniauth.auth']
  "<pre>#{auth}</pre>"
end

get '/auth/failure' do
  "<pre>#{params[:message]}</pre>"
end
