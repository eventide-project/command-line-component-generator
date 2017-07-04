module CommandLine
  class Commands < Thor
    register(CommandLine::Generator::New, 'new', 'new component_name', 'Generates a new Eventide component')
  end
end

CommandLine::Commands.start(ARGV)
