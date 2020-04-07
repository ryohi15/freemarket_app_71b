class Address < ApplicationRecord
  # validates :user_id, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :postcode, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to_active_hash :prefecture
end

