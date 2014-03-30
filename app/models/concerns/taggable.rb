module Taggable
  extend ActiveSupport::Concern

  included do
    has_and_belongs_to_many :tags, index: true
  end

  module ClassMethod; end

  def taggable
    tags.pluck(:name).join(',')
  end

  def taggify tags
    self.tags.clear
    tags.split(',').each { |tag_name| self.tags.push Tag.find_or_create_by(name: tag_name) }
  end

end