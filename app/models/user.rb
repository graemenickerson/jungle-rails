class User < ActiveRecord::Base
  has_secure_password

  validates :f_name, :l_name, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
end
