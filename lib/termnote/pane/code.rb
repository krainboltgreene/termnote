module TermNote
  module Pane
    class Code
      include Pane

      attr_accessor :source, :language

      def initialize(options)
        @source = options[:source] || options['source']
        @language = options[:language] || options['language']
      end

      def rows
        highlighted.split("\n")
      end

      private

      def highlighted
        CodeRay.scan(source, language).term
      end

      def gutter_width(row)
        width * 0.25
      end

      def space
        newlines = height > rows.size ? (height - rows.size) / 2 : 0
        "\n" * newlines
      end
    end
  end
end
