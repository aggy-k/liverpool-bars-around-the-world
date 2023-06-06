require 'open-uri'
puts "DELETE ALL"
t0 = Time.now
City.connection.execute("DELETE FROM cities")
puts "Time: #{Time.now - t0} seconds."

puts "Loading csv from OSS"
t1 = Time.now
cities_csv = URI.open('https://pc-dev-test.oss-cn-shanghai.aliyuncs.com/gallycat/worldcities_clean.csv')
puts "Time: #{Time.now - t1} seconds."

# csv = CSV.parse(cities_csv, :headers=>true)
puts "parsing with SmarterCSV"
t2 = Time.now
csv = SmarterCSV.process(cities_csv) # parse csv to array of hashes, ready for import
puts "Time: #{Time.now - t2} seconds."

puts "Importing.."
t3 = Time.now
City.import(csv)
puts "Finished importing, City count: #{City.count}"
puts "Time: #{Time.now - t3} seconds."
