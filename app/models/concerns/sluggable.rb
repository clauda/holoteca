module Sluggable
  extend ActiveSupport::Concern

  included do
    before_create :slug_me
  end

  def self.included(base)
    base.class_eval do

      def self.by_slug id
        find_by permalink: id if id
      end

    end
  end

  def to_param
    "#{self.title.parameterize}"
  end

  def slug_me
    self.permalink = self.to_param
  end

end