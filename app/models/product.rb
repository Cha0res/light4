class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 1 }
  paginates_per 10
  has_many :comments
  has_attached_file :cover,
                    :styles => { medium: "300x300>", thumb: "100x100>" },
                    :default_url => "/images/users/yonghu.png",
                    :path => ":rails_root/public/uploads/products_cover/:id_:style.:extension",
                    :url => "/uploads/products_cover/:id_:style.:extension"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
end
