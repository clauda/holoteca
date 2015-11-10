class Article
  include Mongoid::Document
  include Mongoid::Timestamps::Updated
  include Taggable
  include Sluggable

  field :title,       type: String
  field :body,        type: String
  field :published,   type: Mongoid::Boolean, default: false
  field :featured,    type: Mongoid::Boolean, default: true
  field :published_at, type: Time, default: ->{ Time.now }
  field :summary,     type: String
  field :permalink,   type: String
  field :cover_url,   type: String
  field :font,        type: String
  field :keywords,    type: Array
  field :meta,        type: Hash, default: { sent: false }

  # metas:
  #   sent: flag to sent article on newsletter 

  index({ title: 1, permalink: 1 }, { unique: true, drop_dups: true })
  
  validates :title, :body, :summary, :category, :author, presence: true
  validates :title, :permalink, uniqueness: { case_sensitive: false, messsage: 'Tente outro título' }

  belongs_to :author, class_name: 'User', index: true, touch: true
  belongs_to :category, index: true, touch: true

  alias_attribute :name, :title

  scope :visible, ->{ where(published: true).order(published_at: :desc).cache }
  scope :lastest, ->{ visible.limit(8) }
  scope :featured, ->{ visible.where(featured: true).limit(8) }
  scope :unread, ->{ visible.where(meta: { sent: false }) }
  scope :related, ->(keys, id){ visible.nin(_id: id).in(keywords: keys).limit(3).cache }

  before_save :publish
  after_save :to_keys

  def publish
    self.published_at = Time.now if self.published_changed?
  end

  def to_keys
    self.keywords = []
    self.tags.pluck(:name).each { |key| self.keywords.push key }
  end

end
