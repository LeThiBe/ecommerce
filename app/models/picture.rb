class Picture < ApplicationRecord
  belongs_to :product
  validates :product_id, presence: true
  validates :url_picture, presence: true

  scope :recent, ->{order created_at: :desc}
end
