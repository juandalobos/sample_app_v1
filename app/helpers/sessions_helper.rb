module SessionsHelper
  # Inicia sesión en el usuario dado.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Recuerda a un usuario en una sesión persistente.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Devuelve el usuario actual (si hay alguno).
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # ¿Es el usuario actual?
  def current_user?(user)
    user == current_user
  end

  # ¿El usuario está logueado?
  def logged_in?
    !current_user.nil?
  end

  # Olvida la sesión persistente del usuario.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Cierra la sesión actual.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Redirige a la URL almacenada o a una por defecto.
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Almacena la URL que el usuario estaba tratando de acceder.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end