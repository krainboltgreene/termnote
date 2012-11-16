module TermNote
  class Show
    module Key
      def self.j(show)
        Control.forward show
      end

      def self.k(show)
        Control.backward show
      end

      def self.q(show)
        Control.quit show
      end
    end
  end
end
