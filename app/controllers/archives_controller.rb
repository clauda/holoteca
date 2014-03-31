class ArchivesController < ApplicationController

  def image
    resource = Archive.find params[:id]
    content = resource.image.read
    if stale?(etag: content, public: true)
      send_data content, type: resource.image.file.content_type, disposition: "inline"
      expires_in 0, public: true
    end
  end

end