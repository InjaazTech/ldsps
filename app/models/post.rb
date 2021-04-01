class Post < ApplicationRecord
  paginates_per 12
  #validates :post_type_id, :attachment_id, :remote_id, :price, :en_title, presence: true

  belongs_to :post_type
  belongs_to :attachment, required: false
  has_many :post_images
  
  scope :visible, ->() {where(is_published: true).order(id: :desc)}
  scope :homepage, ->() {visible.where(show_homepage: true).order(id: :desc)}
  scope :en_title_like, ->(keyword) { visible.where('lower(en_title) LIKE ?', "%#{keyword.try(:downcase)}%") }
  scope :ar_title_like, ->(keyword) { visible.where('lower(ar_title) LIKE ?', "%#{keyword.try(:downcase)}%") }

  after_create :set_slug

  def image_url(size = :full)
    attachment.full_url(size)
  end

  def has_image?
    attachment_id.present?
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
    en_title
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

  private
  def set_slug
    if ar_title.present? && ar_slug.blank?
      clean_ar_title = ar_title.to_s.downcase.strip.gsub(/\s+/, "-").gsub( /[^a-zA-Z0-9أ-ي-]*/ , "")
      attrs[:ar_slug] = "#{id}-#{clean_ar_title}"
    end
    if en_title.present? && en_slug.blank?
      clean_en_title = en_title.to_s.downcase.strip.parameterize
      attrs[:en_slug] = "#{id}-#{clean_en_title}"
    end
    update(attrs)
  end
end
