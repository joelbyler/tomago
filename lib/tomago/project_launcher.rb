require "YAML"
module Tomago
  class ProjectLauncher
    include Tomago::ProjectHelpers

    def initialize(name)
      @project_name = name
      puts project_config

      content = File.read('lib/tomago/templates/launch.ssh.erb')
      Kernel.exec(::Erubis::Eruby.new(content).result(binding))
      puts(::Erubis::Eruby.new(content).result(binding))
    end

    private

    def project_config
      @project_config ||= YAML.load(File.read(project_file))
    end

    def socket
      project_config["name"]
    end

    def window_names
      windows.map{|w|w.keys[0]}
    end

    def windows
      project_config["windows"]
    end
  end
end
