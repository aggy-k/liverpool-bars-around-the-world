# frozen_string_literal: true

class Shared::SearchbarComponent < ViewComponent::Base
  def initialize(location:)
    @location = location
  end

  def width
    @location == 'navbar' ? "w-[20rem]" : "w-[28rem]"
  end
end
