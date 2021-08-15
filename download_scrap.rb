#!/usr/bin/env ruby
require 'httparty'
require 'nokogiri'

def show_downloads 
       url = 'https://rubygems.org/gems/DayFinder'
       v1url="https://rubygems.org/gems/DayFinder/versions/0.1.0"
       v2url="https://rubygems.org/gems/DayFinder/versions/0.2.0"
       req = HTTParty.get(url)
       reqv1=HTTParty.get(v1url)
       reqv2=HTTParty.get(v2url)
       unless req.body.nil?
           parsed = Nokogiri::HTML(req.body)
           download = parsed.xpath('/html/body/main/div/div/div[2]/div[1]/h2[1]/span').text
           puts "Total download ➤ #{download} 💯"
       end
       v1parse=Nokogiri::HTML(reqv1.body)
       v2parse=Nokogiri::HTML(reqv2.body)

       v1dow=v1parse.xpath("/html/body/main/div/div/div[2]/div[1]/h2[2]/span").text
       v2dow=v2parse.xpath("/html/body/main/div/div/div[2]/div[1]/h2[2]/span").text

       puts "⟶ ⟶ ⟶ ⟶ ⟶ ⟶ ⟶ ⟶ ⟶ ⟶ ⟶ ⟶ ⟶"
       puts "Version 1 Downloads ➤ #{v1dow} 🔵"
       puts "Version 2 Downloads ➤ #{v2dow} 🔴"

end
show_downloads
