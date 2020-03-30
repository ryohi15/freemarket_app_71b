class Image < ApplicationRecord
  validates :item_id, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
  belongs_to :item
end
