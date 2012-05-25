unless Rails.env.development?
  Rails.application.config.middleware.use(ExceptionNotifier, {
    :email_prefix => "[adminfincas - #{Rails.env}] ",
    :sender_address => '"Exception Notifier" <exception-notifier-noreply@gestioisolucio.cat>',
    :exception_recipients => ["pyarnau@gmail.com"],
  })
end
