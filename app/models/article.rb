class Article
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  include Taggable
  include Sluggable

  field :title,       type: String
  field :body,        type: String
  field :published,   type: Mongoid::Boolean, default: false
  field :published_at, type: Time, default: ->{ Time.now }
  field :summary,     type: String
  field :permalink,   type: String
  field :cover_url,   type: String

  validates :title, :body, :summary, :category, :author, presence: true
  validates :title, :permalink, uniqueness: { case_sensitive: false, messsage: 'Tente outro título' }

  belongs_to :author, class_name: 'User', index: true, touch: true
  belongs_to :category, index: true, touch: true

  alias_attribute :name, :title

  scope :visible, ->{ where(published: true).order(published_at: :desc) }
  scope :lastest, ->{ visible.limit(5) }

  before_save :setup

  def setup
    self.published_at = Time.now if self.published_changed?
  end

end
