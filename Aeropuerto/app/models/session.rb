class Session
	include ActiveModel::Model#Es para usar el first, create, save que se pone cuando se hace por scaffold

	attr_accessor :user_name, :password

	validates :user_name, presence: true
	validates :password, presence: true

	def authenticate
		current_user && current_user.authenticate(password)
	end

	def current_user
		ariel_user  = User.all.arel_table
 		User.where(ariel_user[:user_name].eq(user_name).or(ariel_user[:email].eq(user_name))).first
	end
end