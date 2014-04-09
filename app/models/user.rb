class User
  include Mongoid::Document
  include Sluggable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Custom
  field :name,              type: String
  field :about,             type: String
  field :role,              type: String
  field :permalink,         type: String

  field :twitter,         type: String
  field :facebook,        type: String
  field :gplus,           type: String
  field :site,            type: String

  has_many :articles

  index({ email: 1 }, { unique: true })

  def first_name
    self.name.split(' ').first
  end

end
