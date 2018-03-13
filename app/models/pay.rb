class Pay < ApplicationRecord
  has_many :orders, dependent: :destroy
end
