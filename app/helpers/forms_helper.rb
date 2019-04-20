# frozen_string_literal: true

module FormsHelper
  # Errors
  def errors(object = "")
    render "lib/components/errors", object: object
  end

  # Submit button
  def submit_button(form = "", label = "")
    haml_tag :div, class: "separator small"
    tag.div class: "form-row" do
      tag.div class: "field col-medium-2-1" do
        tag.div class: "submit" do
          form.button label, data: { disable_with: t("forms.disable_with") }, class: "button double-extra-large green wide"
        end
      end
    end
  end
end
