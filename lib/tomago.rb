$:.unshift(File.expand_path("../", __FILE__))
require "tomago/version"

module Tomago
  autoload :Help, "tomago/help"
  autoload :Command, "tomago/command"
  autoload :CLI, "tomago/cli"
end
