module Docs
  class Bluebird
    class CleanHtmlFilter < Filter
      def call
        css('.post-content > p').remove
        doc
      end
    end
  end
end
