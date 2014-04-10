module Cacheable
  extend ActiveSupport::Concern

  included do; end

  protected

    def expire_modules
      expire_action action: :index
      expire_fragment 'lastest_posts'
      expire_fragment 'featured_posts'
    end

    def expire_resource
      expire_fragment [resource, 'card']  # at lists
      expire_fragment [resource, 'box']   # on index
      expire_fragment [resource, 'thumb'] # on sidebar
      expire_fragment [resource, 'featured']  # on sidebar
    end

end