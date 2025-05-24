class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Iniciar sesión y redirigir al perfil del usuario
      log_in user
      redirect_to user
    else
      # Crear un mensaje de error
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Session successfully closed."
    redirect_to root_url
  end
end