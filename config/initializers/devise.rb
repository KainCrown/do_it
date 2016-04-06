Devise.setup do |config|
  require 'devise/orm/active_record'

  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.omniauth :facebook,  '504037426435841', 'd9fc0e15a2509330960f4463c7effcfa'
  config.omniauth :github, 'fc6c664527b1c36eb1c8', '3f8186e8416e33927625a35c5a0bc4c2db55fd4d'
  config.omniauth :linkedin, '772hxgenbkxa8l', 'L5dUPSv9dFcSIQ55'

  Rails.application.config.to_prepare do
    Devise::SessionsController.layout 'simple'
    Devise::RegistrationsController.layout 'application'
    Devise::ConfirmationsController.layout 'simple'
    Devise::UnlocksController.layout 'simple'
    Devise::PasswordsController.layout 'simple'
  end
end
