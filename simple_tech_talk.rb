require 'sinatra'

$current_page = 0
$page_count = 24
set :sessions, true
set :session_secret, '*&(^B234'

def authenticate!
  unless session[:authorized]
    redirect '/'
  end
end

get '/secret_admin' do
  session['authorized'] = true
  redirect '/admin'
end

get '/admin' do
  authenticate!
  erb :admin
end

get '/next' do
  authenticate!
  $current_page += 1 if $current_page < $page_count
  puts $current_page
  redirect '/admin'
end

get '/previous' do
  authenticate!
  $current_page -= 1 if $current_page > 0
  redirect '/admin'
end

get '/' do
  erb :index
end

get '/current' do
  "%03d" % $current_page
end
