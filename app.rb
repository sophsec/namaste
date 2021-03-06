require 'rubygems'
require 'sinatra'

require 'helpers/lib'
require 'helpers/templates'

require 'namaste'
require 'scandb'

include Namaste
include ScanDB

Namaste::Database.setup
ScanDB::Database.setup

register_template :layout

get '/' do
  @notes = Note.all

  erb :notes
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

post '/comments/create' do
  @comment = Comment.create(params[:comment])

  redirect @comment.note.url
end

get '/hosts/' do
  @hosts = Host.all

  erb :hosts
end

get '/hosts/upload' do
  erb :hosts_upload
end

post '/hosts/submit' do
  Nmap.import_xml(params[:file].path)

  redirect '/hosts/'
end

get '/hosts/:id' do
  @host = Host.first(:id => params[:id])

  erb :hosts_show
end
