require 'byebug'
require_relative 'web_scrapper.rb'

def main
    location = 'columbia'

    data = crawl(location)
    File.open("scraping.csv", "a+") { |f| f.write("buahahahahaha\n") }
end

main