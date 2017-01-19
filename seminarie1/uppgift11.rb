def tag_names(html)
  html.scan(/<(\w*)>/).uniq
end

require 'open-uri.rb'
html = open("http://www.google.com/") { |f| f.read }
