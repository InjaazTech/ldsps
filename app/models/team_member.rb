class TeamMember < ApplicationRecord
  belongs_to :attachment

  def image_url
    attachment.full_url
  end
  
  def name(locale = 'ar')
    read_attribute("#{locale}_name").to_s
  end

  def text(locale = 'ar')
    read_attribute("#{locale}_text").to_s
  end
end
