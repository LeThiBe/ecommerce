class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_many :pictures, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :order_details, dependent: :destroy
  before_destroy :check_if_has_line_item

  validates :name, presence: true, length: {maximum: Settings.product.name_max_length}
  validates :size, presence: true
  validates :price, presence: true
  validates :description, presence: true, length: {maximum: Settings.product.desc_max_length}
  validates :image, presence: true

  scope :search_by_name, ->search do
    where("name LIKE ?", "%#{search}%") if search.present?
  end

  private

  def check_if_has_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, t("model.product.error"))
      return false
    end
  end
end
