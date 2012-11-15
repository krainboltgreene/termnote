module TermNote
  class Show
    attr_accessor :panes

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
      active = true
      while active
        pane.call $stdout.winsize
        case command
          when "j" then forward
          when "k" then backward
          when "q" then active = false
        end
      end
    end

    def forward
      @pane = panes[position + 1] || panes.first
    end

    def backward
      @pane = panes[position - 1] || panes.last
    end

    def header
      "[#{position + 1}/#{total}] - #{panes.first.title}\n".bold
    end

    private

    def command
      $stdin.getch
    end
  end
end
