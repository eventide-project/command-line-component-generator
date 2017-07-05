module CommandLine
  module ProjectGenerator
    module Start
      def self.call(argv)
        CommandLine::ProjectGenerator::Interface.start(argv)
      end
    end
  end
end
