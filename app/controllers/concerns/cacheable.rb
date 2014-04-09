module Cacheable
  extend ActiveSupport::Concern

  included do; end

  protected

    def expire_lastest
      expire_fragment 'lastest_posts'
    end

    def expire_resource
      expire_fragment [resource, 'card']  # at lists
      expire_fragment [resource, 'box']   # on index
      expire_fragment [resource, 'thumb'] # on sidebar
    end

end