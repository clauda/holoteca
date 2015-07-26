class Subscriber
  include Mongoid::Document
  field :email, type: String
  field :active, type: Mongoid::Boolean, default: true

  validates :email, presence: true, uniqueness: true, email: true

  scope :actived, ->{ where(active: true) }
end
