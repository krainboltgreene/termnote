require 'termnote/show/key'

module TermNote
  class Show
    attr_accessor :panes, :state
    attr_writer :pane

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
      @state = true
      while @state
        pane.call $stdout.winsize
        Key.send @command, self if Key::KEYS.include? capture_command
      end
    end

    def close
      @state = false
    end

    def header
      "[#{position + 1}/#{total}] - #{panes.first.title}\n".bold
    end

    def forward
      @pane = panes[position + 1] || panes.first
    end

    def backward
      @pane = panes[position - 1] || panes.last
    end

    private

    def capture_command
      @command = $stdin.getch
    end
  end
end
