class Category < ApplicationRecord
  has_many :subcategories, class_name: "Category", foreign_key: :parent_id, dependent: :destroy
  has_one :parent, class_name: "Category", primary_key: :parent_id, foreign_key: :id
  has_many :products, dependent: :destroy

  scope :search_by_name, lambda{|search|
    where("name LIKE ?", "%#{search}%") if search.present?
  }
end
