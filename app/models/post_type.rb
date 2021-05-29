class PostType < ApplicationRecord
  has_many :posts

  def admin_title
    ar_title
  end
end
