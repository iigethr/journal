# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Journal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # I shrunk the internet
    config.middleware.use Rack::Deflater

    # Set the default locale
    config.i18n.default_locale = :en

    # Timezone configuration
    config.time_zone = "London"
    config.active_record.default_timezone = :local

    # Remove default field errors
    config.action_view.field_error_proc = proc { |html_tag, _instance| html_tag }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Application configuration
    config.application_configuration = config_for(:application_configuration)
  end
end
