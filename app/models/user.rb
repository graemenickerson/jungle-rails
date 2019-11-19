class User < ActiveRecord::Base
  has_secure_password

  validates :f_name, :l_name, :password, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }, confirmation: true


  def self.authenticate_with_credentials(input_email, input_password)
    user = User.where(email: input_email)[0]

    if user && user.authenticate(input_password)
      return user
    else
      return nil
    end
  end

end
