class Item < ApplicationRecord
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :name, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :price, presence: true
  validates :cost, presence: true
  validates :date, presence: true

  belongs_to :user
  belongs_to :user, dependent: :destroy
  belongs_to :category
  has_many :images
  accepts_nested_attributes_for :images

  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'

  mount_uploader :image, ImagesUploader
end
