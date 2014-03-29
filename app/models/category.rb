class Category
  include Mongoid::Document
  field :name, type: String
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }

  has_many :articles

  index({ name: 1 }, { unique: true })

  def to_param
    "#{self.name.parameterize}"
  end

end
