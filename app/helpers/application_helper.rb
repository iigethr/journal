# frozen_string_literal: true

module ApplicationHelper
  # Application configuration
  def application_configuration
    Rails.configuration.application_configuration
  end

  # Breadcrumbs
  def breadcrumbs(path = "")
    render "lib/components/breadcrumbs", path: path
  end

  # Blankslate
  def blankslate
    render "lib/components/blankslate"
  end
end
