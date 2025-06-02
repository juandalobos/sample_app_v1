require "test_helper"

class AccountActivationsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:michael)
    @user.activation_token = User.new_token
    @user.update_attribute(:activation_digest, User.digest(@user.activation_token))
  end

  test "should not log in before activation" do
    log_in_as(@user)
    assert_not is_logged_in?
  end

  test "activation with valid token but wrong email" do
    get edit_account_activation_path(@user.activation_token, email: 'wrong@example.com')
    assert_not is_logged_in?
  end

  test "activation with valid token and email" do
    get edit_account_activation_path(@user.activation_token, email: @user.email)
    assert @user.reload.activated?
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end