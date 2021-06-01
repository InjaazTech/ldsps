class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable , :confirmable, :lockable, :timeoutable, :trackable and :omniauthable :validatable
  devise :database_authenticatable, :recoverable, :rememberable
  
  has_many :attachments

  def full_name
    "#{first_name} #{last_name}"
  end

  def validate_password(pass = '')
    unless valid_password?(pass)
      errors.add(:password, :invalid)
    end
  end
end
