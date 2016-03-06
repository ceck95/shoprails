class User < ActiveRecord::Base
  validates :name, uniqueness: true, presence: {message: "Can't be bank"}
  has_secure_password
  after_destroy :ensure_an_admin_remains
  has_one :cart
  private 
	  def ensure_an_admin_remains
	  	if User.count.zero?
	  		raise "Can't delete last user"
	  	end
	  end
end
