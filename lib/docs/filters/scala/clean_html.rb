module Docs
  class Scala
    class CleanHtmlFilter < Filter
      def call
        if slug == 'index'
          root
        else
          other
        end
      end

      def root
        css('#filter').remove # these are filters to search through the types and packages
        css('#library').remove # these are icons at the top
        doc
      end

      def other
        %w(#mbrsel #inheritedMembers #groupedMembers).each do |selector|
          css(selector).remove
        end


        kind = at_css('.modifier_kind .kind').content
        # this image replacement doesn't do anything on 2.12 docs
        img = at_css('img')
        img.replace %Q|<span class="img_kind">#{kind}</span>| unless img.nil?
        class_to_add = kind == 'object' ? 'value': 'type'
        css('#definition').add_class class_to_add

        # stuff to clean up 212
        css('#subpackage-spacer, #search').remove
        css('.diagram-btn').remove

        # Set id attributes on <h3> instead of an empty <a>
        doc
      end
    end
  end
end
