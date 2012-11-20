require_relative 'pane/helpers'
require_relative 'pane/chapter'
require_relative 'pane/text'
require_relative 'pane/code'
require_relative 'pane/console'
require_relative 'pane/image'

module TermNote
  module Pane
    attr_accessor :show, :height, :width, :rows

    SYSTEM_PADDING = 1

    def call(window_size)
      window_height, window_width = window_size
      @width = window_width
      @height = window_height - 2*SYSTEM_PADDING
      clear
      render
    end

    private

    def clear
      system("clear")
    end

    def render
      puts show.header 
      output = formated_rows
      
      puts space + output + space
    end

    def space
      return "" if (height - output_height) < 0
      "\n" * ((height - output_height) / 2)
    end

    def formated_rows
      @output ||= rows.map(&method(:guttered_row)).join("\n")      
    end

    def output_height
      @output_height ||= rows.map(&method(:guttered_row)).size
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
