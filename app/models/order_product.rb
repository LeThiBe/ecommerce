class OrderProduct < ApplicationRecord
  has_many :line_items, dependent: :destroy
  belongs_to :user
  enum status: {in_progress: 0, approved: 1, cancelled: 2}
  PAY_METHODS = ["Cash on Delivery", "Bank Card"]
  validates :name, :address, :email, :phone, :pay_method, presence: true
  validates :pay_method, inclusion: PAY_METHODS

  scope :sort_by_created, ->{order created_at: :DESC}
  scope :search_by_name, lambda{|search|
    where("name LIKE ?", "%#{search}%") if search.present?
  }

  def add_line_items_from_cart cart
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def total_price_all
    line_items.to_a.sum(&:total_price)
  end

  private

  def set_order_status
    self.status = "in_progress"
  end
end
