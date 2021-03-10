class Category < ApplicationRecord
<<<<<<< HEAD
  has_many :products

  validates :name, presence: true
end

=======
  has_one_attached :photo

  has_many :products

  validates :name, presence: true, uniqueness: true
end
>>>>>>> 82d882ebe2fceb18d894529448cd2febabf85194
