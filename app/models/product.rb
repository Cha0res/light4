class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }
  has_many :comments
end
