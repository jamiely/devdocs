module Docs
  class Scala
    class CleanHtmlFilter < Filter
      def call
        css('hr').remove
        css('#changelog').remove if root_page?

        # Set id attributes on <h3> instead of an empty <a>
        doc
      end
    end
  end
end
