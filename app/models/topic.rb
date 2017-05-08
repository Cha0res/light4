class Topic < ApplicationRecord
  paginates_per 10
  validates :title, presence: true, length: { minimum: 1 }
  belongs_to :user
  has_many :comments
end
