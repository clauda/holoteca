class Tag
  include Mongoid::Document
  include Sluggable

  field :name, type: String
  field :permalink, type: String

  validates :name, :permalink, uniqueness: true

  has_and_belongs_to_many :articles, index: true

  index({ name: 1 }, { unique: true })

  alias_attribute :title, :name

end
