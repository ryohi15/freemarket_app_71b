class Item < ApplicationRecord
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :seller_id,  presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :price, presence: true
  validates :cost, presence: true
  validates :date, presence: true
  accepts_nested_attributes_for :images

  belongs_to :user
  belongs_to :category
  has_many :images

end
