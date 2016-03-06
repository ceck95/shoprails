class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  before_action :authorize
  before_action :set_i18n_locale_from_params
  include CurrentCart
  before_action :set_cart
  skip_before_action :verify_authenticity_token
  # helper_method :xeditable?
  # #protect_from_forgery with: :exception
  # def xeditable?
  #     true # Or something like current_user.xeditable?
  #   end
  protected
    def authorize
    	unless User.find_by(id: session[:user_id])
    		redirect_to login_url,notice: "Please log in"
        flash[:notice] = "Please log in"
    	# respond_to do |format|
    	# 	format.js { @notice = 'Please log in' }
    	# end    
      end
    end
  protected
    def is_admin
        unless User.find_by(id: session[:user_id]).admin == true
          redirect_to store_url, notice: "Not NhutUIT"
        end
    end
  protected
    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
          "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
    def default_url_options
      { locale: I18n.locale }    
    end
end
