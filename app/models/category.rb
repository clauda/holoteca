class Category
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  include Sluggable
  field :name,        type: String
  field :summary,     type: String
  field :permalink,   type: String

  index({ name: 1, permalink: 1 }, { unique: true })
  
  has_many :articles

  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }
end
