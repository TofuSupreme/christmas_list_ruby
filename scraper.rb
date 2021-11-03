require 'nokogiri'
require 'open-uri'

def scrape(search_keyword)
  html_content = URI.open("https://www.etsy.com/search?q=#{search_keyword}").read

  doc = Nokogiri::HTML(html_content)
  etsy_results = {}

  doc.search('.v2-listing-card__title').first(5).each do |element|
    key = element.text.strip.split.first(3).join(' ')
    etsy_results[key] = false
  end
  etsy_results
end
