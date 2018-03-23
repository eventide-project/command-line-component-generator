puts
puts "Loading Component"
puts "- - -"

puts "Defining the messages namespace"
require_relative 'messages_namespace'

puts "Testing the Component Initialization and Message Store Connection"
require_relative 'something-component/test/automated.rb'

puts "= = ="
puts "Component Generated and Tested"
puts
