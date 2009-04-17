require 'rubygems'
require 'sinatra'
require 'helpers/lib'
require 'helpers/templates'

register_template :layout

get '/' do
  erb :index
end

get '/note/new' do
end

post '/note/create' do
end

get '/note/:id' do
end

get '/note/' do
end

post '/comment/create' do
end

get '/comment/:id' do
end

get '/comment/' do
end
