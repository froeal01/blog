class User < ActiveRecord::Base
  has_many :posts
  validates :name, :email, :password, presence: true
  validates :name, uniqueness: true
  validates :email, format:  { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/,
    message: "invalid format" }




  def self.authenticate(username, password) 
    user = User.find_by_name(username)
    if password == user.password
      user
    else
      nil
    end
  end

end

