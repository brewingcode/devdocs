module Docs
  class Bluebird
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        h = at_css('h1.post-title')
        if h
          h.content
        else
          at_css('.post-content h2').content
        end
      end

      def get_type
        'API'
      end

    end
  end
end
