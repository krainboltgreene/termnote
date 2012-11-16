module TermNote
  class Show
    module Control
      def self.forward(show)
        show.pane = show.panes[show.position + 1] || show.panes.first
      end

      def self.backward(show)
        show.pane = show.panes[show.position - 1] || show.panes.last
      end

      def self.quit(show)
        show.state = false
      end
    end
  end
end
