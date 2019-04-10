# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying Playground DB"
Playground.destroy_all

require 'open-uri'
require 'nokogiri'
require 'csv'

all_name = Array.new
all_address = Array.new
cities = Array.new
cities_not_found = Array.new

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = './db/NOM_VILLES.csv'

CSV.foreach(filepath, csv_options) do |row|
  one_city = "#{row}"[(9..-4)]
  if one_city.include?(' ')
  else
    cities << one_city
  end
end

cities.each do |city|

  url_test = "https://www.courtsoftheworld.com/France/#{city}"

  begin
    html_file_test = open(url_test).read
    html_doc = Nokogiri::HTML(html_file_test) do
      # handle doc
    end
  rescue OpenURI::HTTPError => e
    if e.message == '404 Not Found'
      # handle 404 error
      cities_not_found << city
    else
      raise e
    end
  end

end

cities_found = cities - cities_not_found



cities_found.each do |city_found|

  url = "https://www.courtsoftheworld.com/France/#{city_found}"

  html_file = open(url).read
  html_doc = Nokogiri::HTML(html_file)

# Parsing name by city from croutsofworld

  html_doc.css("div.text h5 a").each do |e|
    playground_name = e.text.strip
    all_name << playground_name
  end

# Parsing address by city from croutsofworld

  html_doc.css("div.text .courtdetail").each do |e|
    playground_address = e.text.strip.split(' ').join(' ')
    all_address << playground_address
  end

# puts all_name.length
# puts all_address.length

  i=0
  while i < all_name.length  do
     # puts("#{all_name[i]}" )
     # puts"-----"
     # puts("#{all_address[i]}" )
     # puts "########"
     Playground.create(name: all_name[i], address: all_address[i], city: city_found)
     i +=1
  end


end

#----------------------------------------------------------------------------

# html_file = open(url).read
# html_doc = Nokogiri::HTML(html_file)


# # Parsing name by city from croutsofworld

# html_doc.css("div.text h5 a").each do |e|
#   playground_name = e.text.strip
#   all_name << playground_name
# end

# # Parsing address by city from croutsofworld

# html_doc.css("div.text .courtdetail").each do |e|
#   playground_address = e.text.strip.split(' ').join(' ')
#   all_address << playground_address
# end

# puts all_name.length
# puts all_address.length

# i=0
# while i < all_name.length  do
#    # puts("#{p_names[i]}" )
#    # puts("#{p_addresses[i]}" )
#    Playground.create(name: all_name[i], address: all_address[i], city: city)
#    i +=1
# end

# p1_name = all_name[0]
# p1_address = all_address[0]
# puts "#{p1_name} - #{p1_address}"
# puts all_name.length
# puts all_address.length





