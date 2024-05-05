# frozen_string_literal: true

class Shared::FlashComponent < ApplicationComponent
  def initialize(type:, text:)
    @type = type
    @text = text
  end

  def fa_class
    case @type
    when 'notice'
      'fa-solid fa-circle-check'
    else
      'fa-solid fa-circle-xmark'
    end
  end

  def fa_color
    case @type
    when 'notice' then 'text-green-500'
    when 'error' then 'text-brand-red'
    when 'alert' then 'text-yellow-300'
    else
      'text-yellow-300'
    end
  end
end
