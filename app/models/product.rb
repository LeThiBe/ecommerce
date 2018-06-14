class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_many :pictures, dependent: :destroy
  has_many :reviews, dependent: :destroy
  before_destroy :check_if_has_line_item
  ratyrate_rateable "quality"
  # , "original_score"
  mount_uploader :image, PictureUploader

  scope :search_by_name, lambda{|search|
    where("name LIKE ?", "%#{search}%") if search.present?
  }

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
