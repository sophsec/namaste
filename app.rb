require 'rubygems'
require 'sinatra'
require 'helpers/templates'

register_template :layout

get '/' do
  erb :index
end

get '/submit' do
  erb :submit
end
