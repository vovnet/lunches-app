class Order < ApplicationRecord
  belongs_to :user

  validates :first_id, :main_id, :drink_id, presence: true
end
