module TermNote
  module Pane
    class Chapter
      include Pane

      attr_accessor :title, :subtitle

      def initialize(options)
        @title = options[:title] || options['title']
        @subtitle = options[:subtitle] || options['subtitle']
      end

      def rows
        if subtitle
          title_rows + subtitle_rows
        else
          title_rows
        end
      end

      private

      def title_rows
        title.split('').each_slice(80).map do |row|
          row.join.center(width).bold
        end
      end

      def subtitle_rows
        subtitle.split('').each_slice(80).map do |row|
          row.join.center(width)
        end
      end
    end
  end
end
