class Scrape
  
  def self.scrape_colors(url)
    #url = "http://www.match.com"
    doc = Nokogiri::HTML(open(url))

    links = doc.css('link[rel="stylesheet"]').collect { |a| a['href']}

    puts links

    urls = full_urls(url, links )

    vals = Hash.new(0)
    urls.each do |u|
      begin
        d = open(u)
        d.each do |line|
          words = [line]
          words = line.split(';') if line.count(';') > 1
          words.each do |word|
            puts word
            puts '------'
            val = word.match(/#[0-9a-fA-F]{3,6}|rgba?\([\d+,\.]+\)/)
            vals[val[0]] += 1 if val
          end          
        end
       rescue OpenURI::HTTPError => e
         []
       end
    end
    
    vals.to_a
    
  end
  
  def get_code
    
    
  end
  
  def self.scrape_images(url)
    doc = Nokogiri::HTML(open(url))
  
    urls = doc.css('img').collect { |i| i['src']}
    full_urls( url, urls)
  end
  
  def self.full_urls(base, urls)
    u = urls.collect {|page| URI.join(base, page).to_s }
    u
  end
  
end
#<img alt="99ce48b7217a47549acadfb65667ea99" src="http://starbucks.com//globalassets.starbucks.com/assets/99ce48b7217a47549acadfb65667ea99.jpg">