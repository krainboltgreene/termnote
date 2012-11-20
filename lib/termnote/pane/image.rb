require 'RMagick'
require 'rainbow'

module TermNote
  module Pane
    # This class generates an ASCII representation of an image file.
    # The ASCII generated will fit the screen.

    # To generate the ASCII representation, we look at the pixel
    # intensity. This is calculated as follows:
    #     0.299 * R + 0.587 * G + 0.114 * B
    # Depending on the image type, R, G and B will be in different
    # ranges. This is why we will be quantizing our image, so we
    # only get one intensity per character defined.

    class Image
      include Pane

      # Color depth
      DEPTH = Magick::QuantumDepth ** 2

      # The terminal font is roughly twice as height as it is wide
      FONT_WIDTH_TO_HEIGHT_RATIO = 2

      # Top and bottom padding
      PADDING = 3 

      # The size of the view port
      HEIGHT = $stdout.winsize.first - PADDING*2
      WIDTH = $stdout.winsize.last

      # The chars the will be used to represent the image
      # Note the space at the start
      CHARS = " %HmAv@y<#\$>%^o*:'`.".split(//)

      attr_accessor :image, :enable_border, :enable_color

      def initialize(options)
        filename = options[:filename] || options['filename']
        raise ArgumentError, "Image needs a filename defined" unless filename

        filename = options['__dir'] + "/" + filename unless options['__dir'].nil?

        @image = scale(Magick::Image::read(filename).first).quantize(CHARS.size)
        
        @pixels = []
        @image.each_pixel { |pixel| @pixels << pixel.intensity }
        @pixels = @pixels.uniq.sort

        @enable_border = options[:border] || options['border']
        @enable_color = options[:color] || options['color']
      end

      private

      def rows
        border = generate_border(image.columns)
        generate_ascii.unshift(border).push(border)
      end

      def generate_ascii
        output = [] 
        
        image.rows.times do |i|
          pixels = image.get_pixels(0, i, image.columns, 1)
          pixels.map! {|pixel| color(pixel) }
          output << format_line(pixels.join)
        end
      
        output
      end

      def format_line(line)
        if enable_border
          "|" + line + "|"
        else
          line
        end
      end

      def generate_border(columns = 0)
        if enable_border
          @borders ||= "+" + '-' * columns + "+"
        else
          ""
        end
      end

      def color(pixel)
        char = CHARS[@pixels.index(pixel.intensity)]
        if enable_color
          char.background(pixel.red / DEPTH , pixel.green / DEPTH, pixel.blue / DEPTH)
        else
          char
        end
      end

      def scale(img)
        scaled = img.resize_to_fit(WIDTH, HEIGHT)
        pr = scaled.rows
        pc = scaled.columns * FONT_WIDTH_TO_HEIGHT_RATIO
        scaled = scaled.resize!(pc, pr)
      end
    end
  end
end
