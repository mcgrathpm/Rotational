require 'rubygems'
require 'nokogiri'
require 'open-uri'
class LandingController < ApplicationController
  def index
    @url = params[:name]
    fixed = 'http://' + @url
    ar = Scrape.scrape_colors(fixed )#'http://www.match.com')
    #ar = [["#999999", 3], ["#003799", 3], ["#FFF", 3], ["#007CC4", 4], ["#425AAD", 1], ["#808080", 1], ["#F5F5F5", 3], ["#26469D", 1], ["#0099cc", 2], ["#94B6EA", 2], ["#fff", 2], ["#FFFFFF", 1], ["#555", 1], ["#333", 1], ["#ccc", 1], ["#547fa9", 2], ["#666", 2], ["#000", 2], ["#003366", 2], ["#999", 3], ["#333333", 6]]
    
    @cards =  ar.sort_by{ |c| c[1] }.reverse
    
    @imgs = Scrape.scrape_images( fixed) #'http://www.match.com')
  end
  






 
end
