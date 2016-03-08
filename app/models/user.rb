class User < ActiveRecord::Base
  validates :name, uniqueness: {message: "already name"}, presence: true
  has_secure_password	
  after_destroy :ensure_an_admin_remains
  validates :password, presence: true, length: {within: 4..10}
  has_one :cart
  private 
	  def ensure_an_admin_remains
	  	if User.count.zero?
	  		raise "Can't delete last user"
	  	end
	  end
end
