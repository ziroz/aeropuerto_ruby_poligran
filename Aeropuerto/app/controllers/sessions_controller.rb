class SessionsController < ApplicationController
layout 'public'

  def new
 	@session = Session.new
  end

  def create
  	@session = Session.new(session_params)
	p @session
	if @session.authenticate && @session.authenticate.status
		session['user_id'] = @session.current_user.id
		redirect_to flights_path, notice: 'Bienvenido'
	else
		render :new, :notice => 'Usuario o contraseña incorrecto'
	end

  end

  def delete
		session['user_id'] = nil
		redirect_to login_path
  end


  private
	  def session_params
	      params.require(:session).permit(:user_name, :password)
	    end
end
