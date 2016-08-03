class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session


	before_action :api_authentication, if: :json_request?

  private

	def json_request?
		request.format.json?
	end

	def api_authentication

		if current_token.nil?
			#render json:{ error: 'Token invalid' } 
		else
			current_token.number_of_request += 1
			current_token.save
		end
	end

	def current_token
		@token ||= Token.authenticate(token_params)
	end
	def token_params
		request.headers[:token] || params[:token]
	end
end
