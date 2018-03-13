class Order < ApplicationRecord
  belongs_to :user
  belongs_to :customer
  belongs_to :pay
  has_many :order_details, dependent: :destroy
end
