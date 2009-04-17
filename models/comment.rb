require 'namaste/model'

class Comment

  include Namaste::Model

  property :id, Serial

  property :body, Text

  property :created_at, DateTime

  belongs_to :note

end
