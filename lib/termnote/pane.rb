require_relative 'pane/helpers'
require_relative 'pane/chapter'
require_relative 'pane/text'
require_relative 'pane/code'
require_relative 'pane/console'

module TermNote
  module Pane
    attr_accessor :show, :height, :width, :rows

    def call(window_size)
      window_height, window_width = window_size
      @width = window_width - 50
      @height = window_height
      clear
      render
    end

    private

    def clear
      system("clear")
    end

    def render
      puts show.header + space + formated_rows + space
    end

    def space
     "\n" * (height / 2)
    end

    def formated_rows
      rows.map { |row| gutter + row }.join("\n")
    end

    def gutter
      " " * (width / 10)
    end
  end
end
