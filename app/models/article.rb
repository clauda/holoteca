class Article
  include Mongoid::Document
  include Taggable
  include Sluggable

  field :title,       type: String
  field :body,        type: String
  field :published,   type: Mongoid::Boolean, default: false
  field :published_at, type: Time, default: ->{ Time.now }
  field :summary,     type: String
  field :permalink,   type: String

  validates :title, :body, :summary, :category, :author, presence: true
  validates :title, :permalink, uniqueness: { case_sensitive: false, messsage: 'Tente outro título' }

  belongs_to :author, class_name: 'User', index: true
  belongs_to :category, index: true

  alias_attribute :name, :title

  scope :visible, ->{ where(published: true).order(published_at: :desc) }

  before_save :setup

  def setup
    self.published_at = Time.now
  end

end
