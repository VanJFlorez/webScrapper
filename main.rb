require 'byebug'
require_relative 'web_scrapper.rb'

def main
    location = 'boone'
    data = crawl(location)

    File.open("data_scraped.csv", "w") {  |f| f.write("title, address, month_rent, url\n") }
    data.each do |row|
        File.open("data_scraped.csv", "a+") {  |f| f.write(row + "\n") }
    end

end

main