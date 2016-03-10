class StoreController < ApplicationController
include CurrentCart
skip_before_action :authorize
	def index
		if params[:set_locale]
			redirect_to store_url(locale: params[:set_locale])
		else
			@products = Product.order(:title).page params[:page]
			respond_to do |f|
				f.js
				f.html
			end
		end
		if session[:user_id]
			cart = Cart.find_by(user_id: session[:user_id])
	      	session[:cart_id] = cart.id
      	end
	end
end