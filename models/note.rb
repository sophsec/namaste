require 'namaste/model'

class Note

  include Namaste::Model

  property :id, Serial

  property :body, Text

  has n, :comments

end
