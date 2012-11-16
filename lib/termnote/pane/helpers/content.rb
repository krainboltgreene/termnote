module TermNote
  module Pane
    module Helpers
      module Content
        private

        def content_row
          wrapped_content content
        end

        def wrapped_content(content)
          content.split "\n"
        end
      end
    end
  end
end
