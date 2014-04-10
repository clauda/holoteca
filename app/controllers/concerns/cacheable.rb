module Cacheable
  extend ActiveSupport::Concern

  included do; end

  protected

    def expire_sidebar
      expire_fragment 'lastest_posts'
    end

    def expire_resource
      expire_fragment [resource, 'card']  # at lists
      expire_fragment [resource, 'box']   # on index
      expire_fragment [resource, 'thumb'] # on sidebar
      expire_fragment [resource, 'related']  # on sidebar
    end

end