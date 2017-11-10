class Menu < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :meal_type
  validates :name, :price, :meal_type_id, presence: true
  validates :price, numericality: { only_integer: true }
end
