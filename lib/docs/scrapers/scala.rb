module Docs
  class Scala < FileScraper
    include FixInternalUrlsBehavior

    self.name = 'scala'
    self.type = 'scala'
    self.links = {
      home: 'http://www.scala-lang.org/',
      code: 'https://github.com/scala/scala'
    }

    #options[:only_patterns] = [/\Alibrary\//]

    options[:skip] = %w(
      library/sunau.html)

    options[:attribution] = <<-HTML
      TODO
    HTML

    #version '2.11' do
      #self.release = '2.11.11'
      #self.dir = '/Users/Thibaut/DevDocs/Docs/Scala211' # https://downloads.lightbend.com/scala/2.11.11/scala-docs-2.11.11.zip
      ##self.base_url = 'http://www.scala-lang.org/api/2.11.11'
      #self.root_path = 'api/scala-library/index.html'

      ##html_filters.push 'python/entries_v3', 'sphinx/clean_html', 'python/clean_html'
    #end

    version '2.10' do
      self.release = '2.10.6'
      self.dir = '/Users/Thibaut/DevDocs/Docs/Scala210' # https://downloads.lightbend.com/scala/2.10.6/scala-docs-2.10.6.zip
      self.base_url = 'http://www.scala-lang.org/api/2.10.6'
      self.root_path = 'index.html'
      options[:skip_patterns] = [/index\/index-/]
      options[:only_patterns] = [/scala\/Any.*\.html/, /scala\/collection\/[^\/]+\.html/]
      html_filters.push 'scala/entries', 'scala/clean_html'
    end
  end
end
