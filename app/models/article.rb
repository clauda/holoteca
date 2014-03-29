class Article
  include Mongoid::Document
  field :title,       type: String
  field :body,        type: String
  field :published,   type: Mongoid::Boolean, default: false
  field :published_at, type: Time
  field :summary,     type: String
  field :permalink,   type: String

  validates :title, :body, :summary, :permalink, presence: true
  validates :permalink, uniqueness: true

  belongs_to :author, class_name: 'User', index: true
  belongs_to :category, index: true

  def to_param
    "#{self.title.parameterize}"
  end

end
