class Supplier < ApplicationRecord
  belongs_to :attachment
  scope :visible, ->() {order(position: :asc)}

  def image_url
    attachment.full_url
  end

  def pretty_link
    link.blank? ? '#' : link
  end
end
