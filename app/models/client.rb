class Client < ApplicationRecord
  belongs_to :attachment
  scope :visible, ->() {order(position: :asc)}

  def image_url
    attachment.full_url
  end
end
