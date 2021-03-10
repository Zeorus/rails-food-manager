class Product < ApplicationRecord
  has_one_attached :photo

  has_many :order_products
  belongs_to :category

  validates :name, :category, presence: true
  validates :price, :price_in_menu, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  include PgSearch::Model
  pg_search_scope :search_name_and_category,
    against: [:name, :category, :sub_category],
    using: {
      tsearch: { prefix: true }
    }
end
