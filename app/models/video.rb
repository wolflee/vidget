class Video
  include Mongoid::Document
  field :url, type: String
  field :title, type: String
  field :site, type: String
  field :type, type: String
  field :size, type: Integer
end
