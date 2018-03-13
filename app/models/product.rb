class Product < ApplicationRecord
  belongs_to :category
  has_many :pictures, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :order_details, dependent: :destroy
end
