module Docs
  class Scala
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        # this first condition is mainly for scala 212 docs, which
        # have their package listing as index.html
        if slug.end_with? 'index'
          'package'
        else
          slug.split('/').last
        end
      end

      def get_type
        parts = slug.split('/')
        if %w(index package).member? slug
          nil
        elsif parts.length <= 1
          # for files with no package, return the first item
          parts.first
        else
          # this will return the package name
          parts[0...-1].join('.')
        end
      end

      def include_default_entry?
        true
      end
    end
  end
end
