require 'nokogiri'
require 'httparty'

def crawl(location)
    url = 'https://' + location + '.craigslist.org/search/apa?min_bedrooms=3&max_bedrooms=3&min_bathrooms=2&max_bathrooms=2'
    raw_page = HTTParty.get(url)
    dom_page = Nokogiri::HTML(raw_page)
    byebug
end