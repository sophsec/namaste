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
  @note = Note.create(params[:note])
end

get '/note/:id' do
  @note = Note.first(:id => params[:id])
end

get '/note/' do
  @notes = Note.all
end

post '/comment/create' do
  @comment = Comment.create(params[:comment])
end

get '/comment/:id' do
  @comment = Comment.first(:id => params[:id])
end

get '/comment/' do
  @comments = Comment.all
end
