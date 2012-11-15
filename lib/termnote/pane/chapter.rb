module TermNote
  module Pane
    class Chapter
      include Pane
      include Helpers::Title

      attr_accessor :title, :subtitle

      def initialize(options)
        @title = options[:title] || options['title']
        @subtitle = options[:subtitle] || options['subtitle']
      end

      def rows
        subtitle ? title_row + subtitle_row : title_row
      end

      private

      def subtitle_row
        wrapped_title(subtitle).map &method(:subtitle_row_format)
      end

      def subtitle_row_format(row)
        row.join
      end
    end
  end
end
