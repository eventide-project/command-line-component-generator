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
        copy_file(template_dir + 'settings/message_store_postgres.json.example', "#{component_folder}/setting/message_store_postgres.json.example")
      end

      def create_test
        test_folder = "#{component_folder}/test"

        create_file("#{test_folder}/automated/handle_commands/.gitkeep")
        create_file("#{test_folder}/automated/projection/.gitkeep")
        create_file("#{test_folder}/automated/#{name.downcase}/.gitkeep")

        copy_file(template_dir + 'test/automated.rb', "#{test_folder}/automated.rb")
        copy_file(template_dir + 'test/automated/automated_init.rb', "#{test_folder}/automated/automated_init.rb")
        copy_file(template_dir + 'test/automated/database_connection.rb', "#{test_folder}/automated/database_connection.rb")

        template(template_dir + 'test/test_init.erb', "#{test_folder}/test_init.rb")
      end

      def create_root
        copy_file(template_dir + '_gitignore', "#{component_folder}/.gitignore")
        copy_file(template_dir + 'install-gems.sh', "#{component_folder}/install-gems.sh")
        copy_file(template_dir + 'load_path.rb', "#{component_folder}/load_path.rb")
        copy_file(template_dir + 'test.sh', "#{component_folder}/test.sh")

        template(template_dir + 'init.erb', "#{component_folder}/init.rb")
        template(template_dir + 'Gemfile.erb', "#{component_folder}/Gemfile")
        template(template_dir + "component.gemspec.temp", "#{component_folder}/#{source_name}.gemspec")

        chmod("#{component_folder}/install-gems.sh", 0755)
        chmod("#{component_folder}/test.sh", 0755)
      end

      def finish
        say "\nSuccess!\n\n", :cyan
        say "cd #{component_folder}", :yellow
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
