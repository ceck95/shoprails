class SessionController < ApplicationController
  skip_before_action :authorize
  def new
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to store_url
    elsif user and !user.authenticate(params[:password])
      redirect_to store_url, notice: "sai pass"
  	else
  		redirect_to store_url, notice: "khong login duoc"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url,notice: "Logged out"
  end
end
