# frozen_string_literal: true

module ApplicationHelper
  def application_configuration
    Rails.configuration.application_configuration
  end
end
