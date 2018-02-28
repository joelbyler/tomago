require 'tomago/models/pane'

module Tomago::Models
  class Window
    attr_reader :index, :window_config, :panes, :primary_pane, :secondary_panes
    def initialize(index, window_config)
      @index = index
      @window_config = window_config  #["layout"] || "even-horizontal"
      load_panes
    end

    def name
      window_config.keys[0]
    end

    def layout
      window_config.values[0]["layout"] || "even-horizontal"
    end

    def single_pane?
      panes.length == 1
    end

    private

    def load_panes
      temp_panes = (window_config.values[0]["panes"] || default_panes).clone
      @primary_pane = Tomago::Models::Pane.new(temp_panes.shift)
      @secondary_panes = (temp_panes || []).map{ |p| Tomago::Models::Pane.new(p) }
      @panes = [@primary_pane] + @secondary_panes
    end

    def default_panes
      [ window_config.values[0] ]
    end
  end
end
