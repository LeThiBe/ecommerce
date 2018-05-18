class OrderProduct < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user
  PAY_METHODS = ["Direct payment", "Bank Card"]
  validates :name, :address, :email, :phone, :pay_method, presence: true
  validates :pay_method, inclusion: PAY_METHODS

  def add_line_items_from_cart cart
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end
end
