class HoloController < ApplicationController

  def index
    @categories = Category.all
    @articles = Article.visible
  end
end
