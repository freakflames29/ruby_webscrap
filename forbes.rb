#!/usr/bin/env ruby
require "nokogiri"
require "httparty"

puts "Enter the name of the person"
print "write name :- "
inp=gets.strip.downcase
res=inp.gsub(" ","-")
tmp_url="https://www.forbes.com/profile/"
# url="https://www.forbes.com/profile/elon-musk"
url=tmp_url+res 
# inp="bill"
# puts url
def call url ,inp
    req=HTTParty.get(url)
    if req.code==404
        puts "Check the name please"
        # call url,inp
        exit
    end
    par=Nokogiri::HTML(req.body)
    worth=par.xpath("/html/body/div[1]/main/div/div[1]/div[3]/div[3]/div/div/div[1]/div[1]").text
    worth=par.at(".profile-info__item-value").text
    tmp_rank=par.xpath("/html/body/div[1]/main/div/div[1]/div[6]/div[2]/div/div[1]").text
    rank=tmp_rank.gsub("#","")

    age=par.xpath("/html/body/div[1]/main/div/div[1]/div[7]/div[2]/span[2]").text 
    des=par.xpath("/html/body/div[1]/main/div/div[1]/div[2]/div").text
    # ran
    puts "-------------------------------"

    puts "Name :- #{inp.capitalize}"    
    puts "Known For :- #{des}"
    puts "Age :- #{age}"
    puts "Worth :- #{worth}  "
    puts "Rank :- #{rank}"
    puts "-------------------------------"


end
call url,inp