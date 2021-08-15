#!/usr/bin/env ruby
require "httparty"
puts "It seems like you are bored 😣"
puts "Ok I have some idea for you 🙋"
sleep 4
puts "Fetching New Idea🚀..."
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
    puts "Cool 🆒 ? [y👌/n ❌]"
    us=gets.strip.downcase
    if us=='y'
        puts "Ok lets do it ! 💪"
        break
    else
        puts "Ok Fetching new idea🚀..."
        puts "--------------------------"
    end
end