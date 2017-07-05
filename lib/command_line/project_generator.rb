require 'thor'
require 'thor/group'

require 'casing'

require 'command_line/project_generator/commands/component'
require 'command_line/project_generator/interface'
require 'command_line/project_generator/start'

CommandLine::ProjectGenerator::Start.(ARGV)
