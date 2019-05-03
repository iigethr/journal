# frozen_string_literal: true

module FormsHelper
  # Errors
  def errors(object = "")
    render "lib/components/errors", object: object
  end

  # Submit button
  def submit_button(form = "", label = "")
    render "lib/components/forms/submit", form: form, label: label
  end

  # Submit & Published
  def submit_and_published(form = "", label = "")
    render "lib/components/forms/submit_and_published", form: form, label: label
  end
end
