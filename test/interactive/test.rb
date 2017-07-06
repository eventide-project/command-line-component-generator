puts
puts "Loading Component"
puts "- - -"

puts "Defining the messages namespace"
require_relative 'messages_namespace'

puts "Loading the Component Initializer"
# require_relative 'something-component/init'
require_relative 'something-component/test/automated.rb'

puts "= = ="
puts "Component Generated and Tested"
puts
