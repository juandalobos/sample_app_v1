module SessionsHelper
    # Inicia sesión del usuario
    def log_in(user)
      session[:user_id] = user.id
    end
  
    # Devuelve el usuario actual (si está conectado)
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    # Devuelve true si el usuario está conectado, false en caso contrario
    def logged_in?
      !current_user.nil?
    end
  
    # Cierra la sesión del usuario
    def log_out
      session.delete(:user_id)
      @current_user = nil
    end
  end