# frozen_string_literal: true

class ApplicationComponent < ViewComponent::Base
  def to_html
    self.render_in(ApplicationController.new.view_context)
  end
end
