class Article
  include Mongoid::Document
  field :title,       type: String
  field :body,        type: String
  field :published,   type: Mongoid::Boolean, default: false
  field :published_at, type: Time, default: ->{ Time.now }
  field :summary,     type: String
  field :permalink,   type: String

  validates :title, :body, :summary, :category, :author, presence: true

  belongs_to :author, class_name: 'User', index: true
  belongs_to :category, index: true

  scope :visible, ->{ where(published: true) }

  before_save :setup

  def to_param
    "#{self.title.parameterize}"
  end

  def self.by_slug id
    self.find_by permalink: id
  end

  def setup
    self.permalink = self.to_param
    self.published_at = Time.now
  end

end
