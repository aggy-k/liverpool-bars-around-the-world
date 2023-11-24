# frozen_string_literal: true

class Shared::SearchbarComponent < ApplicationComponent
  attr_reader :location

  def initialize(location:)
    @location = location
  end

  def width
    @location == 'navbar' ? "w-full lg:w-[24rem]" : "w-full lg:w-[28rem]"
  end

  def navbar?
    @location == 'navbar'
  end
end
