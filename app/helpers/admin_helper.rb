module AdminHelper

  def gravatar_url email
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}?d=mm&s=180"
  end

  def label_for status
    raw("<span class='label label-#{status ? 'success' : 'warning'}'>#{status ? 'Publicado' : 'Rascunho'}</span>")
  end

end
