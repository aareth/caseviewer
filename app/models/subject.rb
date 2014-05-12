class Subject
  include MongoMapper::Document

  key :name, String
  key :body

  key :link_ids, Array
  many :links, :in => :link_ids
end
