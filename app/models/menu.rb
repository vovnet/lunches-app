class Menu < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :meal_type
end
