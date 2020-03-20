class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, confirmation: { case_sensitive: false }, length: { minimum: 7 }
  validates :password_confirmation, presence: true
  validates :nickname, presence: true
  validates :last_name, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力して下さい" }
  validates :first_name, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力して下さい" }
  validates :last_name_kana, presence: true,
    format: { with: /\A[ぁ-んー－]+\z/, message: "全角ひらがなで入力して下さい" }
  validates :first_name_kana, presence: true,
    format: { with: /\A[ぁ-んー－]+\z/, message: "全角ひらがなで入力して下さい" }
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true


end
