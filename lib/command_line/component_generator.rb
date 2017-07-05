require 'thor'
require 'thor/group'

require 'casing'

require 'command_line/component_generator/commands/component'
require 'command_line/component_generator/interface'

CommandLine::ComponentGenerator::Interface.start(ARGV)
