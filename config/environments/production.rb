# config/environments/production.rb

Rails.application.configure do
  config.log_formatter = ::Logger::Formatter.new

  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false

  # 👇 Aquí empieza la config del mailer
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address:              "smtp.sendgrid.net",
    port:                 587,
    domain:               "heroku.com",
    user_name:            "apikey", # Fijo
    password:             ENV["SENDGRID_API_KEY"],
    authentication:       :plain,
    enable_starttls_auto: true
  }

  config.action_mailer.default_url_options = {
    host: "sample-app-v1-juanda-1f43c6a6ed77.herokuapp.com",
    protocol: "https"
  }
end