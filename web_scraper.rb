require 'byebug'
require 'nokogiri'
require 'httparty'

def main
    begin
        location = ARGV[0]
        if location.nil?
            location = ""
        end
        data = crawl(location)

        File.open("data_scraped.csv", "w") {  |f| f.write("title, address, month_rent, url\n") }
        data.each do |row|
            File.open("data_scraped.csv", "a+") {  |f| f.write(row + "\n") }
        end
    rescue
        puts "'" + location + "' is not a valid location!"
    end

end

def crawl(location)
    scrapped_data = []
    url = 'https://' + location + '.craigslist.org/search/apa?min_bedrooms=3&max_bedrooms=3&min_bathrooms=2&max_bathrooms=2'
    raw_page = HTTParty.get(url)
    dom_page = Nokogiri::HTML(raw_page)
    # get total items
    items_per_page = dom_page.css("//li[@class='result-row']").count()
    total_items = dom_page.css("div span span span.totalcount")[0].text.to_i
    counter = 0
    while counter <= total_items
        # get all page's items
        url = 'https://' + location + '.craigslist.org/search/apa?min_bedrooms=3&max_bedrooms=3&min_bathrooms=2&max_bathrooms=2&s=' + counter.to_s
        raw_page = HTTParty.get(url)
        dom_page = Nokogiri::HTML(raw_page)
        data_block = dom_page.css("//li[@class='result-row']")    
        data_block.each do |rental_home|
            item = {}
            item[:title] = rental_home.css('p a.result-title').text
            item[:address] = rental_home.css('p span.result-hood').text.split.join.delete('(\(|\))')
            item[:month_rent] = rental_home.css('p span.result-price').text.delete('^0-9').to_i
            item[:url] = rental_home.css('a.result-image')[0]['href']
            scrapped_data.push(item[:title] + ", " + item[:address] + ", $" + item[:month_rent].to_s + ", " + item[:url])
        end
        counter += items_per_page
    end
    return scrapped_data
end

main