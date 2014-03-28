module AdminHelper

  def gravatar_url email
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}?d=mm&s=180"
  end

end
