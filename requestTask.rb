require 'io/console'
require './getTask.rb'
puts "Provide the desised enviroment name. Example: http://\"ENVIROMENT NAME\".service-now.com"
env = gets.chomp
puts "Provide the userID to be used in the connection"
userID = gets.chomp
puts "Provide #{userID} password"
pass = STDIN.noecho(&:gets).chomp

#puts "The stored values are enviroment #{env} userID #{userID} and password #{pass}"

getTask(env,userID,pass)
