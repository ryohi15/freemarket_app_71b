class Item < ApplicationRecord
  validates :name, presence: true, length: { maximum: 40 }
  validates :content, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }
  validates :prefecture_id, presence: true
  validates :status_id, presence: true
  validates :cost_id, presence: true
  validates :delivery_day_id, presence: true
  validates :category_id, presence: true
  validates :images, presence: true
  validates_associated :images
  belongs_to :user
  belongs_to :category
  has_many :images

  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id', optional: true
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id', optional: true

  accepts_nested_attributes_for :images, allow_destroy: true
  

end
