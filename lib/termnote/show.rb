require 'termnote/show/control'
require 'termnote/show/key'

module TermNote
  class Show
    attr_accessor :panes, :state

    def initialize
      @panes ||= []
    end

    def add(pane)
      raise ArgumentError, "Pane required" if pane.nil?
      panes << pane
      pane.show = self
    end

    def pane
      @pane || panes.first
    end

    def position
      panes.index pane
    end

    def total
      panes.size
    end

    def start
      state = true
      while state
        pane.call $stdout.winsize
        Key.send command, self
      end
    end

    private

    def command
      $stdin.getch
    end

    def header
      "[#{position + 1}/#{total}] - #{panes.first.title}\n".bold
    end
  end
end
