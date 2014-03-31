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

  def hidden_if boo
    raw("style='display:none'") if boo
  end

  def gravatar_url email
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}?d=mm&s=180"
  end

  def cover url = nil
    url.nil? ? image_path('default320.png') : url
  end

  class Enum
    SOCIALS = %w(Twitter Facebook GooglePlus Skype WebSite)
  end

  # Add metatags on head.
  # Usage:
  #   <% seo [
  #     { property: 'description', content: nil },
  #   ] %>
  # on views.
  # description metatags has default values on holoteca.yml.
  def seo(metatags)
    metatags.map do |meta|
      metatag meta[:property], meta[:content], (meta[:type] || 'name')
    end
  end

  def metatag(property, content = nil, type = 'name')
    default = content ? content : HOLO['meta'][property]
    content_for :metatags do
      raw "   <meta #{type}='#{property}' content='#{default}' /> \n"
    end
  end

  def title(page_title)
    content_for(:title) { page_title }
  end

end
