class Category
  include Mongoid::Document
  field :name, type: String
  validates :name, presence: true, uniqueness: { case_sensitive: true, messsage: 'Nome em uso.' }

  def to_param
    "#{self.name.parameterize}"
  end

end
