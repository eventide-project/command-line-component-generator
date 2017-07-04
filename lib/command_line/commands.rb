module CommandLine
  class Commands < Thor
    register(CommandLine::Generator::New, 'new', 'new COMPONENT_NAME', 'Generates a new eventide component')
  end
end

CommandLine::Commands.start(ARGV)
