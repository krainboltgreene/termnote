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
      @width = window_width
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

    def guttered_row(row)
      raise ArgumentError, "content was larger than screen" if gutter_width(row) < 0
      gutter(row) + row
    end

    def gutter(row)
      " " * gutter_width(row)
    end

    def gutter_width(row)
      (width / 2.0).floor - (row.width / 2.0).ceil
    end
  end
end
