module CurrentCart
	extend ActiveSupport::Concern
	private
		def set_cart
			if session[:user_id]
			@cart = Cart.find_by(user_id: session[:user_id])
			if @cart
				@cart = Cart.find_by(user_id: session[:user_id])
			else
			    @cart = Cart.create(:user_id => session[:user_id])
			    session[:cart_id] = @cart.id 
			end
			end		
		end
end