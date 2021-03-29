class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable , :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :validatable
  devise :database_authenticatable, :recoverable, :rememberable
  
  has_many :attachments

  def full_name
  end
end
