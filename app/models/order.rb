class Order < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
	validates :name, :address, :email, presence: { message:"Can't be blank" }
	validates_length_of :name, :within => 4..30, :too_short => "More than 4 characters", :too_long => 'Less than 30 characters'
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "Not email"
	validates :address,length: {minimum: 5,too_short: 'Morethan 5 characters'}
	validates :pay_type, inclusion: { in: PAYMENT_TYPES, message: "Is not included in the list" }
	def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item 
		end
	end
end
	