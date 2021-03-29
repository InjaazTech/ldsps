SitemapGenerator::Sitemap.default_host = "https://ldsps.org"

SitemapGenerator::Sitemap.create do
  
  add '/contact-us', lastmod: Time.now, changefreq: "never", priority: 0.1

  # Wpage.find_in_batches do |group_pages|
  #   group_pages.each do |wpage|
  #     add wpage.full_url('en'), lastmod: wpage.updated_at, changefreq: "never" if wpage.en_slug.present?
  #   end
  # end

  # PostType.find_by(slug: 'apartments').posts.find_in_batches do |group_posts|
  #   group_posts.each do |post|
  #     add post.full_url('en'), lastmod: post.updated_at, changefreq: "never" if post.en_slug.present?
  #   end
  # end
end

# rake sitemap:refresh:no_ping
# rake sitemap:refresh
# RAILS_ENV=production bundle exec rake sitemap:refresh:no_ping