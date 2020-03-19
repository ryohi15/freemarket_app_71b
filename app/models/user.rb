class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, confirmation: { case_sensitive: false }
  validates :password_confirmation, presence: true
  validates :name, presence: true, length: { minimum: 7 }
end
