module Docs
  class Scala
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        node = at_css('h1') || at_css('title')
        result = node.content.strip
        result
      end

      def get_type
        object, method = *slug.split('/')
        method ? object : 'Miscellaneous'
      end

      def include_default_entry?
        true
      end
    end
  end
end
