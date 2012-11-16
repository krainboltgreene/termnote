module TermNote
  class Loader
    attr_accessor :document

    def initialize(file)
      if YAML.parse(file)
        @documents = YAML.load_stream(file)
      else
        raise "not a yaml file?"
      end
    end

    def to_panes
      @documents.map do |document|
        type = document['type']
        send type, document
      end
    end
  end
end
