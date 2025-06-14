require "test_helper"

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:example_user)
  end

  test "password resets" do
    # Visitar formulario
    get new_password_reset_path
    assert_template 'password_resets/new'

    # Enviar email inválido
    post password_resets_path, params: { password_reset: { email: "" } }
    assert_not flash.empty?
    assert_template 'password_resets/new'

    # Enviar email válido
    post password_resets_path, params: { password_reset: { email: @user.email } }
    assert_not_equal @user.reset_digest, @user.reload.reset_digest
    assert_equal 1, ActionMailer::Base.deliveries.size
    assert_not flash.empty?
    assert_redirected_to root_url

    # Obtener usuario desde el controller
    user = assigns(:user)

    # Email incorrecto
    get edit_password_reset_path(user.reset_token, email: "")
    assert_redirected_to root_url

    # Usuario no activado (usamos fixture michael)
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to root_url
    user.toggle!(:activated)

    # Token incorrecto
    get edit_password_reset_path('wrong token', email: user.email)
    assert_redirected_to root_url

    # Token correcto y email correcto
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
    assert_select "input[name=email][type=hidden][value=?]", user.email

    # Contraseña inválida
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password: "foo",
                            password_confirmation: "bar" } }
    assert_select 'div#error_explanation'

    # Contraseña vacía
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password: "",
                            password_confirmation: "" } }
    assert_select 'div#error_explanation'

    # Contraseña válida
    patch password_reset_path(user.reset_token),
          params: { email: user.email,
                    user: { password: "foobaz",
                            password_confirmation: "foobaz" } }
    assert is_logged_in?
    assert_not flash.empty?
    assert_redirected_to user
  end
end