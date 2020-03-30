class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {presence: true, format: { with: VALID_EMAIL_REGEX }}
  validates :password, confirmation: { case_sensitive: false }, length: { minimum: 7 }
  validates :nickname, presence: true
  validates :last_name, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力して下さい" }
  validates :first_name, presence: true,
    format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "全角で入力して下さい" }
  validates :last_name_kana, presence: true,
    format: { with: /\A[ぁ-んー－]+\z/, message: "全角ひらがなで入力して下さい" }
  validates :first_name_kana, presence: true,
    format: { with: /\A[ぁ-んー－]+\z/, message: "全角ひらがなで入力して下さい" }
  validates :birth_year, numericality: { only_integer: true, greater_than: 2, less_than: 200}
  validates :birth_month, numericality: { only_integer: true, greater_than: 2, less_than: 100}
  validates :birth_day, numericality: { only_integer: true, greater_than: 2, less_than: 100}

  has_one :address
end
