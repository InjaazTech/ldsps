class Supplier < ApplicationRecord
  belongs_to :attachment
  scope :visible, ->() {order(position: :asc)}

  def image_url
    attachment.full_url
  end

  def pretty_link
    link.blank? ? '#' : (link.include?('img.image_url') ? link : "http://#{link}")
  end
end
