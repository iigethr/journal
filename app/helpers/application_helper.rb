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

  # Active Link
  def active_class(options = {})
    name_of_controller = options[:controller] || nil
    name_of_action     = options[:action]     || nil
    request_path       = options[:path]       || nil

    if request_path.nil?
      "active" if (name_of_action.nil? || name_of_action == action_name) && name_of_controller == controller_name
    else
      request_path == request.path ? "active" : ""
    end
  end
end
