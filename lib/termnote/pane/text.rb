module TermNote
  module Pane
    class Text
      include Pane

      attr_accessor :title, :content

      def initialize(options)
        @title = options[:title] || options['title']
        @content = options[:content] || options['content']
      end

      def rows
        "#{title.center(width).bold}\n\n#{content}".split("\n").map do |row|
          row.center(width)
        end
      end
    end
  end
end
