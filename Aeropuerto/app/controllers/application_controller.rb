class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

	def logged_in?
		p '-*-*-*//*/-/*-*-/-*/*//-/'
		p @current_user
		if current_user.nil?
			redirect_to login_path
		end
	end

	def current_user
		@current_user ||= User.find_by(id: session['user_id'])
	end
end
