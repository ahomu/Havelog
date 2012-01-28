# Helper methods defined here can be accessed in any controller or view in the application

Havelog.helpers do
  # http://www.sinatrarb.com/faq.html#escape_html
  include Rack::Utils
  alias_method :h, :escape_html

  # def simple_helper_method
  #  ...
  # end
  def escape_inbrush arg
    arg.gsub!(/(<pre\s+class="brush:.+?".*?>)(.*?)(<\/pre>)/m) do |m|
      $~[1]+h($~[2])+$~[3]
    end

    #p match[0]
    #p "\n"
    #p match[1]
    #p "\n"
    #p match[2]
    #p "\n"
    #p match[3]
  end
end
