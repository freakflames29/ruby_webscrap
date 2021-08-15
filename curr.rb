#!/usr/bin/env ruby
require "httparty"
require "nokogiri"
require "colorize"

puts "* USA:- USD, INDIA:- INR, BRITISH POUND :- GBP, JAPANESE YAN :- JPY, SOUTH KOREA :- KRW * ".yellow
print "From :- ".green
from=gets.strip.upcase
print "To :- "
to=gets.strip.upcase
print "Enter the amount :- ".colorize(:orange)
am=gets.strip.to_i
url="https://www.xe.com/currencyconverter/convert/?Amount=#{am}&From=#{from}&To=#{to}"

def cal url 
    req=HTTParty.get(url)
    if req.code == 200
        pars=Nokogiri::HTML(req.body)
        theam=pars.xpath('//*[@id="__next"]/div[2]/div[2]/section/div[2]/div/main/form/div[2]/div[1]/p[1]').text
        conv=pars.xpath('//*[@id="__next"]/div[2]/div[2]/section/div[2]/div/main/form/div[2]/div[1]/p[2]').text 
        puts "----------------------"*2
        puts "#{theam} #{conv.green}"
        puts "----------------------"*2
    else
        puts "Bad request"
    end
end
cal url
