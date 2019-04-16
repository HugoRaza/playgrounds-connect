require 'open-uri'
require 'nokogiri'
require_relative 'top_cities'

puts "destroying Playground DB"
Playground.destroy_all

URL_ROOT = "https://www.courtsoftheworld.com/France/"

TOP_CITIES.each do |city|
  begin
    html_doc = Nokogiri::HTML(open(URL_ROOT + city).read)
    court_details = html_doc.css("div.text .courtdetail")

    html_doc.css("div.text h5 a").each_with_index do |e, index|
      Playground.create!(city: city, name: e.text.strip, address: court_details[index].text.strip.split(' ').join(' '))
    end

    sleep(0.5)
    p "playgrounds created in #{city}"
  rescue StandardError => e
    puts e.message
  end
end
