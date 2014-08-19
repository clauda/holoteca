class Book
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  include Sluggable

  field :title,       type: String
  field :summary,     type: String
  field :published,   type: Mongoid::Boolean, default: false
  field :permalink,   type: String

  alias_attribute :name, :title

  validates :title, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }

  has_many :articles

  index({ title: 1 }, { unique: true })

  accepts_nested_attributes_for :articles
end
