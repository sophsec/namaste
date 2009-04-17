require 'rubygems'
require 'sinatra'

require 'helpers/lib'
require 'helpers/templates'

require 'models/note'
require 'models/comment'

register_template :layout

get '/' do
  erb :front
end

get '/notes/new' do
  erb :notes_new
end

post '/notes/create' do
  @note = Note.create(params[:note])
end

post '/notes/update' do
  @note = Note.first(:id => params[:id])

  @note.attributes = params[:note]
  @note.save!

  redirect "/notes/#{@note.id}"
end

get '/notes/:id/edit' do
  @note = Note.first(:id => params[:id])
end

get '/notes/:id' do
  @note = Note.first(:id => params[:id])
end

get '/notes/' do
  @notes = Note.all
end

post '/comments/create' do
  @comment = Comment.create(params[:comment])

  redirect "/notes/#{@comment.note_id}"
end

get '/comments/' do
  @comments = Comment.all
end
