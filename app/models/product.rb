class Product < ApplicationRecord
  has_one_attached :photo
  belongs_to :category
  has_many :order_products
<<<<<<< HEAD

  validates :name, presence: true
=======
  belongs_to :category

  validates :name, :category, presence: true
>>>>>>> 82d882ebe2fceb18d894529448cd2febabf85194
  validates :price, :price_in_menu, presence: true, numericality: { greater_than_or_equal_to: 0.0 }

  include PgSearch::Model
  pg_search_scope :search_name_and_category,
    against: [:name, :category, :sub_category],
    using: {
      tsearch: { prefix: true }
    }
end
