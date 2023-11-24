require 'open-uri'

# puts "SEED CITIES DELETE ALL"
# t0 = Time.now
# City.connection.execute("DELETE FROM cities")
# puts "Time: #{Time.now - t0} seconds."

# puts "Loading csv from OSS"
# t1 = Time.now
# cities_csv = URI.open('https://pc-dev-test.oss-cn-shanghai.aliyuncs.com/gallycat/worldcities_clean.csv')
# puts "Time: #{Time.now - t1} seconds."

# # csv = CSV.parse(cities_csv, :headers=>true)
# puts "parsing with SmarterCSV"
# t2 = Time.now
# csv = SmarterCSV.process(cities_csv) # parse csv to array of hashes, ready for import
# puts "Time: #{Time.now - t2} seconds."

# puts "Importing.."
# t3 = Time.now
# City.import(csv)
# puts "Finished importing, City count: #{City.count}"
# puts "Time: #{Time.now - t3} seconds."

# puts "======== Seed Carras"
# ny = City.find_by_name("New York")
# if ny.present?
#   puts "NY present"
#   v = Venue.new(
#       name: "Carragher's NY",
#       address: "17 John Street, New York 10038",
#       city: ny,
#       latitude: ny.latitude,
#       longitude: ny.longitude,
#       phone_number: "646-414-6223",
#       instagram: "carrasnyc",
#       facebook: "carrasny",
#       tiktok: "carrasny",
#       twitter: "carrasny",
#       email: "info@carraghersnyc.com",
#       website: "https://www.carraghersnyc.com"
#     )
#   v.save!
#   puts "venue saved, attaching image"
#   v.images.attach(io: URI.open("https://images.squarespace-cdn.com/content/v1/62d71ed449e81c62227cac88/e3f9c796-df78-4988-8fb6-f6890f13aa7c/BOOTROOM_CARRAGHERS_1.jpg"), filename: Devise.friendly_token(8))
#   puts "finished"
# end


# 5.times do
#   u = User.create!(email: Faker::Internet.email, username: Faker::Internet.username, password: '12345678')
#   u.avatar.attach(io: URI.open(Faker::Avatar.image), filename: Devise.friendly_token(8))
#   Comment.create!(body: Faker::Lorem.sentences(number: 2), user: u, venue: Venue.first)
# end

# City.update_all(country_id: nil)
# Country.destroy_all

# array = CSV.read(Rails.root.join("db", "seeds", "continents_countries.csv"))
# array = array.map.with_index do |x,i|
#   next if i.zero?
#   {continent_name: x.first, name: x.last}
# end
# Country.insert_all(array.reject(&:nil?))

# query = <<~SQL
#   UPDATE cities SET country_id = countries.id
#   FROM countries WHERE countries.name = cities.country_name
# SQL

# City.connection.execute(query)

