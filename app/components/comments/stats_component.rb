# frozen_string_literal: true

class Comments::StatsComponent < ApplicationComponent
  attr_reader :comment

  def initialize(comment:)
    @comment = comment
  end
end
