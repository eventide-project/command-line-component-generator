# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'evt-command_line-component_generator'
  s.version = '0.1.0.7'
  s.summary = 'Command line project generator'
  s.description = ' '

  s.authors = ['The Eventide Project']
  s.email = 'opensource@eventide-project.org'
  s.homepage = 'https://github.com/eventide-project/command-line-component-generator'
  s.licenses = ['MIT']

  s.require_paths = ['lib']
  s.files = Dir.glob('{lib,source}/**/*', File::FNM_DOTMATCH)
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4.0'

  s.bindir = 'executable'
  s.executables = Dir.glob('executable/*').map(&File.method(:basename))

  s.add_runtime_dependency 'thor'
  s.add_runtime_dependency 'evt-casing'

  s.add_development_dependency 'test_bench'
end
