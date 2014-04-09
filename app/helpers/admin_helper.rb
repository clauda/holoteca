module AdminHelper

  def label_for status
    raw("<span class='label label-#{status ? 'success' : 'warning'}'>#{status ? 'Publicado' : 'Rascunho'}</span>")
  end

end
