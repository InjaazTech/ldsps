class WebsiteConfig < ApplicationRecord
  validates :slug, presence: true, uniqueness: true
  validates :val, presence: true

  def self.cache!
    Rails.cache.write('website-configs', WebsiteConfig.select('id, slug, val').to_ary, expires_in: 1.year)
  end

  def self.get(k, locale = 'ar')
    Rails.cache.fetch('website-configs').select{|s| s.slug == k || s.slug == "#{locale}-#{k}"}.first.try(:val).to_s
  end

  def self.refresh!
    Rails.cache.delete('website-configs')
    cache!
  end

  def image?
    t == 'image'
  end
end
