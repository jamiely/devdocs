module Docs
  class Scala
    class InternalUrlsFilter < Filter
      def call
        return doc if context[:fixed_internal_urls]

        if subpath == '/index.html'
          result[:internal_urls] = internal_urls
        end

        doc
      end

      def internal_urls
        css('a.tplshow').inject [] do |urls, link|
          urls << link['href']
          urls
        end
      end
    end
  end
end
