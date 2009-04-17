require 'rubygems'
require 'sinatra'

require 'helpers/lib'
require 'helpers/templates'

require 'models/note'
require 'models/comment'

register_template :layout

get '/' do
  erb :index
end

get '/notes/new' do
end

post '/notes/create' do
  @note = Note.create(params[:note])
end

get '/notes/:id' do
  @note = Note.first(:id => params[:id])
end

get '/notes/' do
  @notes = Note.all
end

post '/comments/create' do
  @comment = Comment.create(params[:comment])
end

get '/comments/:id' do
  @comment = Comment.first(:id => params[:id])
end

get '/comments/' do
  @comments = Comment.all
end
