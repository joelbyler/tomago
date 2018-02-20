module Tomago::ProjectHelpers
  attr_reader :project_name

  def project_file
    "#{ENV["HOME"]}/.tomago/#{project_name}.yml"
  end

  def ensure_tomago_dir
    return if Dir.exists?("#{ENV["HOME"]}/.tomago/")
    Dir.mkdir("#{ENV["HOME"]}/.tomago/")
  end
  def launch_editor
    Kernel.system("$EDITOR #{project_file}")
  end
end
