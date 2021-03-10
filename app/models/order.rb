class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  validates :payement, presence: true, inclusion: { in: ["CB", "Espèce"], message: "%{value} is not a valid payement" }
end
