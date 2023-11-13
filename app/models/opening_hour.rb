class OpeningHour < ApplicationRecord
  belongs_to :venue

  WEEKDAY_NAMES = %w[Sun Mon Tue Wed Thu Fri Sat]
  enum :wday, WEEKDAY_NAMES

  # hours -> jsonb example:
  # [{"open"=>"07:00", "close"=>"23:00"}]
  # [["07:00", "23:00"]]

  # def display_hour(time)
  #   t = Time.parse(time)
  #   I18n.l(t, format: :just_time_p)
  # end

  # def display_hours_array
  #   hours.map do |h|
  #     "#{display_hour(h['open'])} - #{display_hour(h['close'])}"
  #   end
  #     .join(", ")
  # end

  # def display_hours_and_wday_array
  #   [
  #     I18n.t('.date.abbr_day_names')[wday],
  #     display_hours_array
  #   ]
  # end
end
