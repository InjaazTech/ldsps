class TeamMember < ApplicationRecord
  belongs_to :attachment

  scope :homepage, ->() {where(show_homepage: true).order(order_position: :asc)}

  def has_image?
    attachment_id.present?
  end

  def image_url(size = :full)
    attachment.full_url(size)
  end
  
  def name(locale = 'ar')
    read_attribute("#{locale}_name").to_s
  end

  def text(locale = 'ar')
    read_attribute("#{locale}_text").to_s
  end
end
