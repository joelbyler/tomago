require "YAML"
require 'tomago/models/window'
module Tomago
  class ProjectLauncher
    include Tomago::ProjectHelpers

    attr_reader :windows, :primary_window, :secondary_windows

    def initialize(name, debug: false)
      @project_name = name
      load_windows

      content = File.read("#{File.dirname(__FILE__)}/templates/launch.ssh.erb")
      if debug
        puts(::Erubis::Eruby.new(content).result(binding))
      else
        Kernel.exec(::Erubis::Eruby.new(content).result(binding))
      end
    end

    def has_on_project_start?
      !on_project_start.nil?
    end

    def on_project_start
      project_config["on_project_start"]
    end

    private

    def project_config
      @project_config ||= YAML.load(File.read(project_file))
    end

    def root_directory
      project_config["root"]
    end

    def socket
      project_config["name"]
    end

    def window_names
      @windows.map{|w|w.name}
    end

    private

    def load_windows
      windows = project_config["windows"].clone
      @primary_window = Tomago::Models::Window.new(1, windows.shift)
      @secondary_windows = windows.each_with_index.map do |w, i|
        Tomago::Models::Window.new(i + 2, w)
      end
      @windows = [@primary_window] + @secondary_windows
    end
  end
end
