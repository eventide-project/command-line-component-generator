module CommandLine
  module ProjectGenerator
    class Interface < Thor
      register(CommandLine::ProjectGenerator::Commands::Component, 'component', 'component NAME', 'Generates a new Eventide component')
    end
  end
end
