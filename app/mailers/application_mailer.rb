# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: "juan.villalobos@somosinternet.co"
  layout "mailer"
end