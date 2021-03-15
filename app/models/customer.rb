class Customer < ApplicationRecord
  has_many :orders

  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A(?:(?:\+|00)33|0)\s*[1-9](?:[\s.-]*\d{2}){4}\z/, message: "Invalid phone number" }
  validates :address, presence: true
  validates :zip_code, presence: true, format: { with: /\A(0[1-9]|[1-8]\d|9[0-5])\d{3}\z/, message: "Invalid zip code" }
  validates :city, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_address?

end
