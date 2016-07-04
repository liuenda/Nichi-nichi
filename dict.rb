require_relative 'quip'
require_relative 'config'
require 'nokogiri'
require 'open-uri'

def search(word)
  doc = Nokogiri::HTML(open(URI.encode(SEARCH_URI + word)))

  entries = doc.css("div.NetDicHead")
  if entries.size == 0
    puts "No result"
  else
    explans = doc.css("div.NetDicBody")
    puts entries[0].content
    puts explans[0].content
    promptQuipSave(entries[0].content)
  end
end

def promptQuipSave(content)
  print "Save to quip?"
  res = gets.strip.downcase
  if res.start_with? 'y'
    quip_edit(content)
  end
end

def main
  loop do
    print "> "
    word = gets
    search word
  end
end

main
