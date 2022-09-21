class Railtie < ::Rails::Railtie
  config.before_configuration do |app|
    app.config.autoload_paths << "#{app.root}/app/models/validators"
  end
end