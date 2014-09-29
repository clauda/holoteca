require 'rubygems'
require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = 'http://holoteca.com.br'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps'
SitemapGenerator::Sitemap.compress = true
SitemapGenerator::Sitemap.create_index = true
SitemapGenerator::Sitemap.include_index = false
SitemapGenerator::Sitemap.include_root = false

SitemapGenerator::Sitemap.create do
  add root_path, changefreq: 'hourly', priority: 1.0
  add contact_path, changefreq: 'monthly'
  add privacy_path, changefreq: 'monthly'

  group(filename: :tags) do
    Tag.all.each do |tag|
      add tag_path(tag)
    end
  end

  Category.includes(:articles).all.each do |category|
    group(filename: category.slug_me.to_sym) do
      add category_path(category), changefreq: 'hourly', priority: 0.9

      category.articles.visible.each do |article|
        add article_path(article), lastmod: article.published_at
      end
    end
  end
end

SitemapGenerator::Sitemap.ping_search_engines

