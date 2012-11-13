module TermNote
  module Pane
    class List
      include Pane

      attr_accessor :title, :items

      def initialize(options)
        @title = options[:title] || options['title']
        @items = options[:items] || options['items']
      end

      def rows
        items.map { |item| "* #{item}" }.unshift title.bold + "\n"
      end

      def gutter
        " " * (width * 0.5)
      end
    end
  end
end
