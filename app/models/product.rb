class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :category
  has_many :order_products

  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, :price_in_menu, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  include PgSearch::Model
  pg_search_scope :search_name,
    against: [:name],
    associated_against: {
      category: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
