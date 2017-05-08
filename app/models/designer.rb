class Designer < ApplicationRecord
  paginates_per 10
  has_attached_file :avatar,
                    :styles => { medium: "300x300>", thumb: "100x100>" },
                    :default_url => "admins/tupian200-200-.png",
                    :path => ":rails_root/public/uploads/designers_avatar/:id_:style.:extension",
                    :url => "/uploads/designers_avatar/:id_:style.:extension"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
