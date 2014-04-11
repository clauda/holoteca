module ApplicationHelper

  def notify
    { notice: 'success', error: 'danger', alert: 'warning', info: 'info', success: 'success', failure: 'error' }
  end

  def options_tag_for field
    collection_for[field].collect{|i|[i,i]}
  end

  def collection_for
    { socials: Enum::SOCIALS }
  end

  def date_for date = nil
    date.strftime('%d/%m/%Y %H:%M') unless date.nil?
  end

  def time_for time = nil
    time.strftime("%H:%M")
  end

  def moment_for date
    # "2013-02-08 09:30:26"
    date.strftime('%Y-%m-%d %H:%M:%S') unless date.nil?
  end

  def hidden_if boo
    raw("style='display:none'") if boo
  end

  def gravatar_url email
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}?d=mm&s=180"
  end

  def cover url = nil
    (url.nil? || url.blank?) ? image_path('default320.png') : url
  end

  class Enum
    SOCIALS = %w(Twitter Facebook GooglePlus Skype WebSite)
  end

end
