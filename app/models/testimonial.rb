class Testimonial < ApplicationRecord
  scope :visible, ->() {order(position: :asc)}

  def user_name(locale = 'ar')
    read_attribute("#{locale}_name").to_s
  end

  def user_name_postition(locale = 'ar')
    read_attribute("#{locale}_position").to_s
  end

  def user_text(locale = 'ar')
    read_attribute("#{locale}_text").to_s
  end
end
