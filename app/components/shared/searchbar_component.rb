# frozen_string_literal: true

class Shared::SearchbarComponent < ApplicationComponent
  def initialize(location:)
    @location = location
  end

  def width
    @location == 'navbar' ? "w-[20rem]" : "w-[28rem]"
  end
end
