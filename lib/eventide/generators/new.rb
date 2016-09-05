module Eventide
  module Generators
    class New < Thor::Group
      include Thor::Actions
      argument :name

      def self.source_root
        File.dirname(__FILE__)
      end

      def create_lib
        lib_folder = "#{component_folder}/lib"
        source_name = "#{name}_component"
      
        template(template_dir + 'lib/component.erb', "#{lib_folder}/#{source_name}.rb")

        empty_directory("#{lib_folder}/#{source_name}/commands")
        empty_directory("#{lib_folder}/#{source_name}/controls/commands")
        empty_directory("#{lib_folder}/#{source_name}/controls/events")
        empty_directory("#{lib_folder}/#{source_name}/events")

        template(template_dir + 'lib/controls.erb', "#{lib_folder}/#{source_name}/controls.rb")
        template(template_dir + 'lib/projection.erb', "#{lib_folder}/#{source_name}/projection.rb")
        template(template_dir + 'lib/store.erb', "#{lib_folder}/#{source_name}/store.rb")

        # TODO make example command handler optional or move to seperate generator
        template(template_dir + 'lib/handlers/commands.erb', "#{lib_folder}/#{source_name}/handlers/commands.rb")
        
        # TODO make example test optional or move to seperate generator
        template(template_dir + 'lib/controls/schema.erb',"#{lib_folder}/#{source_name}/controls/schema.rb")
        template(template_dir + 'lib/validation/has_all_attributes.erb', "#{lib_folder}/#{source_name}/validation/has_all_attributes.rb")
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

        template(template_dir + 'test/test_init.erb', "#{test_folder}/test_init.rb")
        template(template_dir + 'test/logger_settings.erb', "#{test_folder}/logger_settings.rb")
        template(template_dir + 'test/automated/automated_init.erb', "#{test_folder}/automated/automated_init.rb")
        template(template_dir + 'test/script/script_init.erb', "#{test_folder}/script/script_init.rb")
        
        # TODO make example test optional or move to seperate generator
        template(template_dir + 'test/automated/validation/has_all_attributes.erb', "#{test_folder}/automated/validation/has_all_attributes.rb")   
      end

      def component_folder
        "#{name.lisp_case}-component"
      end

      def template_dir
        '../../../templates/'
      end
    end
  end
end