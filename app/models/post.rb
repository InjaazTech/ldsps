class Post < ApplicationRecord
  paginates_per 12
  #validates :post_type_id, :attachment_id, :remote_id, :price, :en_title, presence: true

  belongs_to :post_type
  belongs_to :attachment, required: false
  belongs_to :en_attachment, class_name: 'Attachment', foreign_key: 'en_attachment_id', required: false
  has_many :post_images
  
  scope :visible, ->() {where(is_published: true).order(id: :desc)}
  scope :homepage, ->() {visible.where(show_homepage: true).order(id: :desc)}
  scope :best_projects, ->() {visible.where(is_best: true).order(id: :desc)}
  scope :title_like, ->(keyword) { visible.where('lower(en_title) LIKE ? OR lower(ar_title) LIKE ?', "%#{keyword.try(:downcase)}%", "%#{keyword.try(:downcase)}%") }
  scope :en_title_like, ->(keyword) { visible.where('lower(en_title) LIKE ?', "%#{keyword.try(:downcase)}%") }
  scope :ar_title_like, ->(keyword) { visible.where('lower(ar_title) LIKE ?', "%#{keyword.try(:downcase)}%") }

  after_commit :set_slug

  def image_url(size = :full)
    attachment.full_url(size)
  end

  def has_image?
    attachment_id.present?
  end

  def en_image_url(size = :full)
    has_en_image? ? en_attachment.full_url(size) : image_url(size)
  end

  def has_en_image?
    en_attachment_id.present?
  end

  def album?
    post_type && post_type.slug == 'album'
  end

  def report?
    post_type && post_type.slug == 'report'
  end

  def project?
    post_type && post_type.slug == 'project'
  end

  def admin_title
    ar_title
  end

  def title(locale)
    read_attribute("#{locale}_title")
  end

  def subtitle(locale)
    read_attribute("#{locale}_subtitle")
  end

  def content(locale)
    read_attribute("#{locale}_content").to_s.html_safe
  end

  def path(locale = 'en')
    "/#{locale}/#{post_type.slug}s/#{read_attribute("#{locale}_slug")}"
  end

  def pretty_date
    created_at.strftime('%Y-%m-%d')
  end

  def subtitle_first_content_words(words_count = 50, locale = 'ar')
    Nokogiri::HTML.parse(subtitle(locale)).text.force_encoding('utf-8').mb_chars.limit(5*words_count).to_s
  end

  private
  def set_slug
    attrs = {}
    if ar_title.present? && ar_slug.blank?
      clean_ar_title = ar_title.to_s.downcase.strip.gsub(/\s+/, "-").gsub( /[^a-zA-Z0-9أ-ي-]*/ , "")
      attrs[:ar_slug] = "#{id}-#{clean_ar_title}"
    end
    if en_title.present? && en_slug.blank?
      clean_en_title = en_title.to_s.downcase.strip.parameterize
      attrs[:en_slug] = "#{id}-#{clean_en_title}"
    end
    update_columns(attrs) unless attrs.empty?
  end
end
