class PostImage < ApplicationRecord
  belongs_to :post
  belongs_to :attachment

  def image_url
    attachment.try(:full_url)
  end
end