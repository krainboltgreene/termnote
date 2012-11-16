module TermNote
  module Pane
    class Console
      include Pane

      attr_accessor :binary

      def initialize(options)
        @binary = options[:binary] || options['binary']
      end

      private

      def render
        system binary
        show.forward
      end
    end
  end
end
