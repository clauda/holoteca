class Archive
  include Mongoid::Document
  field :image, type: String
  mount_uploader :image, ImageUploader
  attr_accessor :image_cache
  validates :image, presence: true
  index({ image: 1 })
end
