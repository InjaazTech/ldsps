class Wpage < ApplicationRecord
  scope :footer_links, ->() {where(show_footer: true).order(id: :asc)}
  scope :header_links, ->() {where(show_header: true).order(id: :asc)}

  # before_create :set_slug
  after_commit :set_slug

  def title(locale)
    read_attribute("#{locale}_title")
  end

  def subtitle(locale)
    read_attribute("#{locale}_subtitle")
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
    ar_title
  end

  def path(locale = 'en')
    "/#{locale}/pages/#{slug(locale)}"
  end

  def first_content_words(words_count = 50, locale = 'ar')
    Nokogiri::HTML.parse(content(locale)).text.force_encoding('utf-8').mb_chars.limit(5*words_count).to_s
  end

  # private
  # def set_slug
  #   self.ar_slug = ar_title.downcase.gsub(/\s+/, "-").gsub( /[^a-zA-Z0-9أ-ي-]*/ , "")
  #   self.en_slug, self.tr_slug = en_title.to_s.downcase.parameterize, tr_title.to_s.downcase.parameterize
  # end
  private
  def set_slug
    attrs = {}
    if ar_title.present? && ar_slug.blank?
      clean_ar_title = ar_title.to_s.downcase.strip.gsub(/\s+/, "-").gsub( /[^a-zA-Z0-9أ-ي-]*/ , "")
      attrs[:ar_slug] = clean_ar_title
    end
    if en_title.present? && en_slug.blank?
      clean_en_title = en_title.to_s.downcase.strip.parameterize
      attrs[:en_slug] = clean_en_title
    end
    p attrs
    update_columns(attrs) unless attrs.empty?
  end
end
