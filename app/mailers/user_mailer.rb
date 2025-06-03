class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, from: "juan.villalobos@somosinternet.co", subject: "Account activation"
  end
end