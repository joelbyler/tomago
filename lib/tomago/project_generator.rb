module Tomago
  class ProjectGenerator
    include Tomago::ProjectHelpers

    def initialize(name)
      @project_name = name
      ensure_tomago_dir
      generate_project_file
      launch_editor
    end

    private

    def generate_project_file
      out_file = File.new(project_file, "w")
      out_file.puts(generate_project_configuration)
      out_file.close
    end

    def generate_project_configuration
      require 'erubis'
      input = File.read('lib/tomago/templates/project.yml.erb')
      eruby = Erubis::Eruby.new(input)
      eruby.result(binding())
    end

  end
end
