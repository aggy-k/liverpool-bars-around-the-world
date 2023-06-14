# frozen_string_literal: true

class Shared::CardComponent < ApplicationComponent
  def initialize(venue:)
    @venue = venue
  end

end
