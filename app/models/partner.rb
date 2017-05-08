class Partner < ApplicationRecord
  paginates_per 10
  has_attached_file :logo,
                    :styles => { medium: "300x300>", thumb: "100x100>" },
                    :default_url => "admins/tupian200-200-.png",
                    :path => ":rails_root/public/uploads/partners_logo/:id_:style.:extension",
                    :url => "/uploads/partners_logo/:id_:style.:extension"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end