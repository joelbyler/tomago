$:.unshift(File.expand_path("../", __FILE__))
require "tomago/version"
require "tomago/project_helpers"
require "tomago/project_generator"
require "tomago/project_launcher"
require "erubis"

module Tomago
  autoload :Help, "tomago/help"
  autoload :Command, "tomago/command"
  autoload :CLI, "tomago/cli"
end
