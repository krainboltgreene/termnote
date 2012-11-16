module TermNote
  class Show
    module Key
      KEYS = %w[j k q]

      def self.j(show)
        show.forward
      end

      def self.k(show)
        show.backward
      end

      def self.q(show)
        show.close
      end
    end
  end
end
