module CommandLine
  module ComponentGenerator
    class Interface < Thor
      register(CommandLine::ComponentGenerator::Commands::Component, 'component', 'component NAME', 'Generates a new Eventide component')
    end
  end
end
