class Category
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  include Sluggable
  field :name,        type: String
  field :summary,     type: String
  field :permalink,   type: String

  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }

  has_many :articles

  index({ name: 1 }, { unique: true })
end
