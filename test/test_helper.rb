ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Carga todas las fixtures desde test/fixtures/*.yml
  fixtures :all

  # Incluye los helpers para poder usarlos en los tests
  include ApplicationHelper

  # Verifica si el usuario está logueado
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Inicia sesión como un usuario determinado (usado en tests tipo Unit)
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  # Inicia sesión como un usuario determinado (usado en tests tipo Integration)
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: {
      session: {
        email: user.email,
        password: password,
        remember_me: remember_me
      }
    }
  end
end