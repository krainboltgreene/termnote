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
        case type
          when "chapter" then Pane::Chapter.new document
          when "code" then Pane::Code.new document
          when "list" then Pane::List.new document
          when "text" then Pane::Text.new document
        end
      end
    end
  end
end
