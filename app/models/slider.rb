class Slider < ApplicationRecord
  belongs_to :attachment
  scope :visible, ->() {where(hidden: false).order(order_position: :asc)}

  def image_url
    attachment.full_url
  end

  def has_link?
    link.present?
  end

  def title(locale = 'ar')
    read_attribute("#{locale}_title").to_s
  end

  def subtitle(locale = 'ar')
    read_attribute("#{locale}_subtitle").to_s
  end

  def link_title(locale = 'ar')
    read_attribute("#{locale}_link_title").to_s
  end

  def has_title?(locale = 'ar')
    !title(locale).blank?
  end
end
