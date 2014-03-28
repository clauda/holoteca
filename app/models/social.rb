class Social
  include Mongoid::Document
  field :network,         type: String
  field :username,        type: String
  field :url,             type: String
  embedded_in :user
  validate :user, uniqueness: { scope: :network }
end
