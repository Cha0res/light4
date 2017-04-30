class User < ApplicationRecord
  has_secure_password
  has_many :topics
  has_many :comments
  before_create { generate_token(:auth_token) }
  has_attached_file :avatar,
                    :styles => { medium: "300x300>", thumb: "100x100>" },
                    :default_url => "users/yonghu.png",
                    :path => ":rails_root/public/uploads/users_avatar/:id_:style.:extension",
                    :url => "/uploads/users_avatar/:id_:style.:extension"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
