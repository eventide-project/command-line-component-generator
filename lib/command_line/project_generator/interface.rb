module CommandLine
  module ProjectGenerator
    class Interface < Thor
      register(CommandLine::ProjectGenerator::Commands::New, 'new', 'new component_name', 'Generates a new Eventide component')
    end
  end
end
