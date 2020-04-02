class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :category
  has_many :images

  belongs_to :seller, class_name: 'User', :foreign_key => 'seller_id'
  belongs_to :buyer, class_name: 'User', :foreign_key => 'buyer_id'

  mount_uploader :image, ImagesUploader
end
