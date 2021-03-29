class ContactUser < ApplicationRecord
  validates :email, :name, :message, presence: true
end
