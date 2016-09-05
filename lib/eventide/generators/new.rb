module Eventide
  module Generators
    class New < Thor::Group
      include Thor::Actions
      argument :name

      def self.source_root
        File.dirname(__FILE__)
      end

      def create_lib
        component_folder = "#{name.lisp_case}-component"
        lib_folder = "#{component_folder}/lib"
        source_name = "#{name}_component"
      
        template(template_dir + 'lib/component.erb', "#{lib_folder}/#{source_name}.rb")

        empty_directory("#{lib_folder}/#{source_name}/commands")
        empty_directory("#{lib_folder}/#{source_name}/controls/commands")
        empty_directory("#{lib_folder}/#{source_name}/controls/events")
        empty_directory("#{lib_folder}/#{source_name}/events")

        template(template_dir + 'lib/handlers/commands.erb', "#{lib_folder}/#{source_name}/handlers/commands.rb")
        template(template_dir + 'lib/validation/has_all_attributes.erb', "#{lib_folder}/#{source_name}/validation/has_all_attributes.rb")
        template(template_dir + 'lib/controls.erb', "#{lib_folder}/#{source_name}/controls.rb")
        template(template_dir + 'lib/projection.erb', "#{lib_folder}/#{source_name}/projection.rb")
        template(template_dir + 'lib/store.erb', "#{lib_folder}/#{source_name}/store.rb")
      end

      def template_dir
        '../../../templates/'
      end
    end
  end
end