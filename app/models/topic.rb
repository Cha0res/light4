class Topic < ApplicationRecord
  paginates_per 10
  validates :title, presence: true, length: { minimum: 5 }
  has_many :comments
end
