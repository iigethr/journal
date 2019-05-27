# frozen_string_literal: true

require_relative "./controller_support"

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :view
  config.extend ControllerSupport, type: :controller
end
