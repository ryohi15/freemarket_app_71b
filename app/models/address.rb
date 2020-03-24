class Address < ApplicationRecord
  # validates :user_id, presence: true
  validates :postcode, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true

  belongs_to :user
end

