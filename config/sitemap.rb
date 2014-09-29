require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://holoteca.com.br'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps'
SitemapGenerator::Sitemap.create_index = false
SitemapGenerator::Sitemap.include_index = false
SitemapGenerator::Sitemap.include_root = false

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'hourly', priority: 1.0
  add contact_path, changefreq: 'monthly'
  add privacy_path, changefreq: 'monthly'

  Article.visible.each do |article|
    add article_path(article), priority: 1.0, lastmod: article.updated_at
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

Tag.includes(:articles).all.each do |tag|
  SitemapGenerator::Sitemap.namer = SitemapGenerator::SimpleNamer.new tag.to_param.to_sym
  add tag_path(tag), changefreq: 'hourly', priority: 0.9
end

SitemapGenerator::Sitemap.ping_search_engines
