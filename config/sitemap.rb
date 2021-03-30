SitemapGenerator::Sitemap.default_host = "https://ldsps.org"

SitemapGenerator::Sitemap.create do
  
  add '/en/contact-us', lastmod: Time.now, changefreq: "never", priority: 0.1
  add '/en/about', lastmod: Time.now, changefreq: "never", priority: 0.1
  add '/ar/contact-us', lastmod: Time.now, changefreq: "never", priority: 0.1
  add '/ar/about', lastmod: Time.now, changefreq: "never", priority: 0.1

  PostType.find_by(slug: 'project').posts.visible.find_in_batches do |group_posts|
    group_posts.each do |post|
      add post.path('en'), priority: 0.9, lastmod: post.updated_at, changefreq: "weekly" if post.en_slug.present?
      add post.path('ar'), priority: 0.9, lastmod: post.updated_at, changefreq: "weekly" if post.ar_slug.present?
    end
  end
  PostType.find_by(slug: 'report').posts.visible.find_in_batches do |group_posts|
    group_posts.each do |post|
      add post.path('en'), priority: 0.9, lastmod: post.updated_at, changefreq: "weekly" if post.en_slug.present?
      add post.path('ar'), priority: 0.9, lastmod: post.updated_at, changefreq: "weekly" if post.ar_slug.present?
    end
  end
end

# rake sitemap:refresh:no_ping
# rake sitemap:refresh
# RAILS_ENV=production bundle exec rake sitemap:refresh:no_ping