require ::File.expand_path('../config/environment',  __FILE__)
run Senergy::Application

Senergy::Application.config.middleware.use(ExceptionNotifier, {
  :email_prefix => "[#{Rails.env}] ",
  :sender_address => ['"Exception notifier" <notifier@example.com>'],
  :exception_recipients => ["pyarnau@gmail.com"],
})
