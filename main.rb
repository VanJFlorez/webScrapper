require 'byebug'
require_relative 'web_scrapper.rb'

def main
    location = 'columbia'

    crawl(location)

    puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    File.open("scraping.csv", "a+") { |f| f.write("buahahahahaha\n") }
end

main