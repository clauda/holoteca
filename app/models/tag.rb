class Tag
  include Mongoid::Document
  field :name, type: String
  has_and_belongs_to_many :articles

  def to_param
    "#{self.name.parameterize}"
  end
end
