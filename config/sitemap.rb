require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://holoteca.com.br'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps'
SitemapGenerator::Sitemap.create_index = true
SitemapGenerator::Sitemap.include_index = false
SitemapGenerator::Sitemap.include_root = false

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'hourly', priority: 1.0

  # Category.all.each do |category|
  #   add_to_index "sitemaps/#{category.to_param}.xml.gz"
  # end

  Article.visible.each do |article|
    add(article_path(article), news: {
      publication_name: 'Holoteca',
      publication_language: 'pt',
      title: article.title,
      keywords: article.taggable,
      publication_date: article.published_at.to_date,
      genres: 'Blog'
    })

  end
end

Category.includes(:articles).all.each do |category|
  SitemapGenerator::Sitemap.namer = SitemapGenerator::SimpleNamer.new category.to_param.to_sym
  add category_path(category), changefreq: 'hourly', priority: 0.9

  SitemapGenerator::Sitemap.create do
    category.articles.visible.each do |article|
      add article_path(article), lastmod: article.published_at
    end
  end
end

SitemapGenerator::Sitemap.ping_search_engines