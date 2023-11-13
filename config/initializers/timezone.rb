 Timezone::Lookup.config(:geonames) do |c|
   c.username = Rails.application.credentials.dig(:geonames)
 end
