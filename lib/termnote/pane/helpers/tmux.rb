module TermNote
  class Show
    module Helpers
      class Tmux
        private

        def self.tmux?
          @@tmux ||= `which tmux` && ENV['TMUX'].length
        end

        def self.needs_zoom_out
          `tmux list-panes -F '\#F'`.include? 'Z'
        end

        def self.needs_zoom_in
          !self.needs_zoom_out
        end

        def self.toggle_zoom
          system('tmux resize-pane -Z')
        end

        def self.ensure_zoomed_in
          if self.tmux?
            system('tmux set status off')
            self.needs_zoom_in && self.toggle_zoom
          end
        end

        def self.ensure_zoomed_out
          if self.tmux?
            system('tmux set status on')
            self.needs_zoom_out && self.toggle_zoom
          end
        end
      end
    end
  end
end
