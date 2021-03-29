class PostType < ApplicationRecord
  has_many :posts

  def admin_title
    en_title
  end
end
