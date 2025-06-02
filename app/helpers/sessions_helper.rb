module SessionsHelper

  # Inicia sesión del usuario dado.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Recuerda a un usuario en una sesión persistente.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Devuelve el usuario correspondiente al token de sesión o cookie.
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
    @current_user
  end

  # Devuelve true si el usuario ha iniciado sesión, false en caso contrario.
  def logged_in?
    !current_user.nil?
  end

  # Olvida una sesión persistente.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Cierra la sesión del usuario actual.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end