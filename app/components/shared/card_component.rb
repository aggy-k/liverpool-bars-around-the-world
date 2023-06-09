# frozen_string_literal: true

class Shared::CardComponent < ViewComponent::Base
  def initialize(venue:)
    @venue = venue
  end

end
