require 'rubygems'
require 'sinatra'

require 'helpers/lib'
require 'helpers/templates'

require 'namaste'

include Namaste

Database.setup

register_template :layout

get '/' do
  erb :front
end

get '/notes/new' do
  erb :notes_new
end

post '/notes/create' do
  @note = Note.create(params[:note])

  redirect @note.url
end

post '/notes/update' do
  @note = Note.first(:id => params[:id])

  @note.attributes = params[:note]
  @note.save!

  redirect @note.url
end

get '/notes/:id/edit' do
  @note = Note.first(:id => params[:id])

  erb :notes_edit
end

get '/notes/:id' do
  @note = Note.first(:id => params[:id])

  erb :notes_show
end

get '/notes/' do
  @notes = Note.all

  erb :notes
end

post '/comments/create' do
  @comment = Comment.create(params[:comment])

  redirect @comment.note.url
end
