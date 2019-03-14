# frozen_string_literal: true

require "rails_helper"

RSpec.describe ApplicationController do
  let(:user) { instance_double(User) }
  before { log_in(user) }
end
