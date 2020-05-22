require 'byebug'
require_relative 'web_scrapper.rb'

def main
    location = 'boone'
    data = crawl(location)
    data.each do |row|
        File.open("data_scraped.csv", "a+") {  |f| f.write(row + "\n") }
    end

end

main