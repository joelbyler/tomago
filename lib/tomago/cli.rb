module Tomago
  class CLI < Command
    class_option :verbose, type: :boolean
    class_option :noop, type: :boolean

    desc "hello NAME", "say hello to NAME"
    long_desc Help.text(:hello)
    option :from, desc: "from person"
    def hello(name="you")
      puts "from: #{options[:from]}" if options[:from]
      puts "Hello #{name}"
    end

    desc "version", "prints version"
    def version
      puts Tomago::VERSION
    end

    desc "new NAME", "generate a new project workspace configuration file"
    def new(name)
      ProjectGenerator.new(name)
    end

    desc "[launch] NAME", "launch tmate with specific project configuration"
    def launch(name)
      ProjectLauncher.new(name)
    end
  end
end
