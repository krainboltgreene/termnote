require 'RMagick'

module TermNote
  module Pane
    class Image
      include Pane

      # Padding is how many lines are used by the system 
      # to show header and footer. This is subtracted from 
      # both ends of the image.
      PADDING = 3

      # How big is our font. In our terminal our 
      # font height is always twice our font width
      FONT_WIDTH = 4
      FONT_HEIGHT = FONT_WIDTH * 2

      # We resize our image to this size, 
      # before we start working on it
      HEIGHT = ($stdout.winsize.first - PADDING*2) * FONT_HEIGHT
      WIDTH = HEIGHT

      attr_accessor :image, :chars, :border

      def initialize(options)
        filename = options['__dir'] + "/" + (options[:filename] || options['filename'])
        @border = options[:border] || options['border']
        @chars = [" "] + %w( % H m A v @ y < # $ > % ^ o * : ' ` .)
        @image = scale(Magick::Image::read(filename).first).quantize(chars.size)
      end

      private

      def rows
        # The intensity of a pixel is what gives it, its 
        # character in the end. This is calculated as 
        #     0.299 * R + 0.587 * G + 0.114 * B
        # This value is between 0 and 65535.
        # However, because we quantize our image, we know that
        # we will only get 20 (chars.size) different values.
        p = []
        image.each_pixel { |pixel| p << pixel.intensity }
        p = p.uniq.sort

        # 
        ascii = [border(image.columns)]
        line = borderline

        image.each_pixel do |pixel, column|
          line += chars[p.index(pixel.intensity)]
          if column == image.columns - 1
            ascii << line + borderline
            line = borderline
          end 
        end
        
        ascii << border
      end

      def border(columns = 0)
        return "" unless @border
        @b ||= "+#{'-' * columns}+"
      end

      def borderline
        return "" unless @border
        "|"
      end

      def scale(img)
        scaled = img.resize(WIDTH, HEIGHT)
        pr = scaled.rows / FONT_HEIGHT
        pc = scaled.columns / FONT_WIDTH
        scaled = scaled.resize!(pc, pr)
      end
    end
  end
end
