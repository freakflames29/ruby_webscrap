#!/usr/bin/env ruby
require "httparty"
puts "It seems like you are bored π£"
puts "Ok I have some idea for you π"
sleep 4
puts "Fetching New Ideaπ..."
puts "-----------------------"
url="https://www.boredapi.com/api/activity/"
req=HTTParty.get(url)

nf=true
while nf
    url="https://www.boredapi.com/api/activity/"
    req=HTTParty.get(url)
    if req.code!=404
        puts "Try it :- #{req["activity"]}"
        puts "Type :- #{req["type"]}"
    else
        puts "Bad Bad"
    end
    puts "Cool π ? [yπ/n β]"
    us=gets.strip.downcase
    if us=='y'
        puts "Ok lets do it ! πͺ"
        break
    else
        puts "Ok Fetching new ideaπ..."
        puts "--------------------------"
    end
end