module TermNote
  module Pane
    module Helpers
      module Title
        private

        def title_row
          wrapped_title(title).map &method(:title_row_format)
        end

        def title_row_format(row)
          row.join.center(80).bold
        end

        def wrapped_title(title)
          title.split('').each_slice(80)
        end
      end
    end
  end
end
