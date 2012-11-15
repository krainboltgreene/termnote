module TermNote
  module Pane
    class Text
      include Pane
      include Helpers::Title
      include Helpers::Content

      attr_accessor :title, :content

      def initialize(options)
        @title = options[:title] || options['title']
        @content = options[:content] || options['content']
      end

      private

      def rows
        title ? title_row + content_row : content_row
      end

      def gutter_width(row)
        width * 0.25
      end
    end
  end
end
