require 'io/console'
require 'smart_colored/extend'
require 'coderay'
require 'yaml'
require_relative 'termnote/version'
require_relative 'termnote/pane'
require_relative 'termnote/show'
require_relative 'termnote/pane'

module TermNote
  def show
    @show ||= Show.new
  end

  def chapter(options)
    Pane::Chapter.new options
  end

  def text(options)
    Pane::Text.new options
  end

  def code(options)
    Pane::Code.new options
  end

  def list(options)
    Pane::List.new options
  end

  def console(options)
    Pane::Console.new options
  end
end

