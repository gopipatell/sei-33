# Jacked from rack-cors Github documentation, which see.

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
      :headers => :any,
      :methods => %i( get post put patch delete options head ) # array of symbols
  end
end
