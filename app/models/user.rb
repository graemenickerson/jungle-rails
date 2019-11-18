class User < ActiveRecord::Base
  has_secure_password

  validates :f_name, :l_name, :password, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }, confirmation: true
end
