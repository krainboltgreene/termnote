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
        Pygments.highlight source, formatter: 'terminal256', lexer: language
      end
    end
  end
end
