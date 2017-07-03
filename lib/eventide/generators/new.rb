module Eventide
  module Generators
    class New < Thor::Group
      include Thor::Actions
      argument :name

      def self.source_root
        File.dirname(__FILE__)
      end

      def create_lib           
        template(template_dir + 'lib/component.erb', "#{lib_folder}/#{source_name}.rb")   
      end

      def create_component
        template(template_dir + 'lib/controls.erb', "#{lib_folder}/#{source_name}/controls.rb")
        template(template_dir + 'lib/entity.erb', "#{lib_folder}/#{source_name}/#{name}.rb")
        template(template_dir + 'lib/projection.erb', "#{lib_folder}/#{source_name}/projection.rb")
        template(template_dir + 'lib/store.erb', "#{lib_folder}/#{source_name}/store.rb")   
      end

      def create_controls
        create_file("#{lib_folder}/#{source_name}/controls/messages/.gitkeep")
        create_file("#{lib_folder}/#{source_name}/controls/events/.gitkeep")

        template(template_dir + 'lib/controls/id.erb', "#{lib_folder}/#{source_name}/controls/id.rb")
        template(template_dir + 'lib/controls/entity.erb',"#{lib_folder}/#{source_name}/controls/#{name}.rb")
        template(template_dir + 'lib/controls/time.erb', "#{lib_folder}/#{source_name}/controls/time.rb")
        template(template_dir + 'lib/controls/version.erb', "#{lib_folder}/#{source_name}/controls/version.rb")
      end

      def create_handlers
        template(template_dir + 'lib/handlers/commands.erb', "#{lib_folder}/#{source_name}/handlers/commands.rb")
        template(template_dir + 'lib/handlers/events.erb', "#{lib_folder}/#{source_name}/handlers/events.rb")
      end

      def create_messages
        create_file("#{lib_folder}/#{source_name}/messages/events/.gitkeep")
        create_file("#{lib_folder}/#{source_name}/messages/messages/.gitkeep")
      end

      def create_settings
        copy_file(template_dir + 'settings/event_store_client_http.json', "#{component_folder}/setting/event_store_client_http.json")
      end

      def create_test
        test_folder = "#{component_folder}/test"

        empty_directory("#{test_folder}/fixtures")
        empty_directory("#{test_folder}/automated/handle_commands")
        empty_directory("#{test_folder}/automated/projection")
        empty_directory("#{test_folder}/automated/validation")

        copy_file(template_dir + 'test/automated.rb', "#{test_folder}/automated.rb")

        template(template_dir + 'test/test_init.erb', "#{test_folder}/test_init.rb")
        template(template_dir + 'test/logger_settings.erb', "#{test_folder}/logger_settings.rb")
        template(template_dir + 'test/automated/automated_init.erb', "#{test_folder}/automated/automated_init.rb")
        template(template_dir + 'test/script/script_init.erb', "#{test_folder}/script/script_init.rb")
        
        # TODO make example test optional or move to seperate generator
        template(template_dir + 'test/automated/validation/has_all_attributes.erb', "#{test_folder}/automated/validation/has_all_attributes.rb")   
      end

      def create_root
        copy_file(template_dir + '_gitignore', "#{component_folder}/.gitignore")
        copy_file(template_dir + 'load_path.rb', "#{component_folder}/load_path.rb")
        copy_file(template_dir + 'install-gems.sh', "#{component_folder}/install-gems.sh")
        copy_file(template_dir + 'set-local-gem-path.sh', "#{component_folder}/set-local-gem-path.sh")
        copy_file(template_dir + 'test.rb', "#{component_folder}/test.rb")

        template(template_dir + 'init.erb', "#{component_folder}/init.rb")
        template(template_dir + "component.gemspec.temp", "#{component_folder}/#{source_name}.gemspec")

        chmod("#{component_folder}/install-gems.sh", 0755)
        chmod("#{component_folder}/set-local-gem-path.sh", 0755)
      end

      def finish
        say "\nSuccess!\n\n", :cyan
        say "cd #{component_folder}", :yellow
        say "export GEM_AUTHORITY_PATH=gem.fury.io/eventide", :yellow
        say "POSTURE='development' ./install-gems.sh\n\n", :yellow
      end

      def source_name
        "#{name}_component"
      end

      def component_folder
        "#{name.lisp_case}-component"
      end

      def lib_folder
        "#{component_folder}/lib"
      end

      def template_dir
        '../../../templates/'
      end
    end
  end
end
