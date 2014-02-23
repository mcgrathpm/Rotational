require 'rubygems'
require 'nokogiri'
require 'open-uri'

task pull: :environment do
  url = "http://www.match.com"
  doc = Nokogiri::HTML(open(url))
  
  images = doc.css('img').collect { |i| i['src']}
  
  puts images

end

# def full_urls( base, urls)
#   processed = []
#   urls.each do |url|
#     if url.include? 'http:'
#       processed << url
#     else
#       processed << base + url
#     end
#   end
#   processed
# end
