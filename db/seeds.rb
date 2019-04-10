# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'open-uri'
require 'nokogiri'

city = 'lyon'
url = "https://www.courtsoftheworld.com/France/#{city}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

all_name = []
all_address = []

html_doc.css("div.text h5 a").each do |e|
  playground_name = e.text.strip
  all_name << playground_name
end

html_doc.css("div.text .courtdetail").each do |e|
  playground_address = e.text.strip.split(' ').join(' ')
  all_address << playground_address
end

p1_name = all_name[0]
p1_address = all_address[0]
puts "#{p1_name} - #{p1_address}"
puts all_name.length
puts all_address.length

# html_doc.search('.text').each do |element|
#   title = element.text.strip
#   puts title
#   puts "---------"
# end
