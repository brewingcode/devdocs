# frozen_string_literal: true

module Docs
  class ContainerFilter < Filter
    class ContainerNotFound < StandardError; end

    def whine(container)
      html = doc.to_html
      puts html.unpack('U'*html.length).collect {|x| x.to_s 16}.join ' '
      raise(ContainerNotFound, "element '#{container}' could not be found in the document, url=#{current_url}")
    end

    def call
      container = context[:container]
      container = container.call self if container.is_a? Proc

      if container
        doc.at_css(container) || whine(container)
      elsif doc.name == 'document'
        doc.at_css('body')
      else
        doc
      end
    end
  end
end
