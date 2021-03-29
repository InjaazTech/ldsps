class Wpage < ApplicationRecord
  scope :footer_links, ->() {where(show_footer: true).order(id: :asc)}
  scope :header_links, ->() {where(show_header: true).order(id: :asc)}

  before_create :set_slug

  def title(locale)
    read_attribute("#{locale}_title")
  end

  def content(locale)
    read_attribute("#{locale}_content").to_s.html_safe
  end

  def slug(locale)
    read_attribute("#{locale}_slug")
  end

  def self.find_by_all_slugs(s)
    Wpage.find_by_ar_slug(s) || Wpage.find_by_en_slug(s) || Wpage.find_by_tr_slug(s)
  end

  def admin_title
    en_title
  end

  private
  def set_slug
    self.ar_slug = ar_title.downcase.gsub(/\s+/, "-").gsub( /[^a-zA-Z0-9أ-ي-]*/ , "")
    self.en_slug, self.tr_slug = en_title.to_s.downcase.parameterize, tr_title.to_s.downcase.parameterize
  end
end
