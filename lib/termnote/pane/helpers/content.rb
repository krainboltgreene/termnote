module TermNote
  module Pane
    module Helpers
      module Content
        private

        def content_row
          wrapped_content(content).map &method(:content_row_format)
        end

        def content_row_format(row)
          row.center(80)
        end

        def wrapped_content(content)
          content.split("\n")
        end
      end
    end
  end
end
