module Eventide
  class Commands < Thor
    register(Eventide::Generators::New, 'new', 'new COMPONENT_NAME', 'Generates a new eventide component')
  end
end

Eventide::Commands.start(ARGV)