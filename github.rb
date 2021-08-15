require 'httparty'
puts "Enter user name "
name=gets.strip
url="https://api.github.com/users/#{name}"
req=HTTParty.get(url)
if req["message"]=="Not Found"
    puts "User not found"
    exit
end
puts"------------------------------------"
puts "Username :- #{req["login"]}"
puts "Name :- #{req["name"]}"
puts "Public Repo:- #{req["public_repos"]}"
puts "Public Gists:- #{req["public_gists"]}"
puts "Followers:- #{req["followers"]}"
puts "Following:- #{req["following"]}"
 puts "Location:- #{req["location"]}" if req["location"]
puts "View on github:- #{req["html_url"]}"
