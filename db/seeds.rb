require 'open-uri'
require 'nokogiri'
require_relative 'top_cities'

puts "destroying Playground DB"
Playground.destroy_all

URL_ROOT = "https://www.courtsoftheworld.com/France/"

TOP_CITIES.each do |city|
  begin
    html_doc = Nokogiri::HTML(open(URL_ROOT + city).read)

    html_doc.css("div.text h5 a").each do |e|
      Playground.create!(city: city, name: e.text.strip, address: e.text.strip.split(' ').join(' '))
    end

    p "playgrounds created in #{city}"
  rescue StandardError => e
    puts e.message
  end
end
