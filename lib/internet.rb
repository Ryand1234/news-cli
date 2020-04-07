require 'net/http'
require 'nokogiri'

def link_text(url) 
  page = Net::HTTP.get("www.google.com",url)

  parse_page = Nokogiri::HTML(page)
  links_text = parse_page.css("a").map{|link| link.text}
  links = parse_page.css("a").map{|link| link["href"]}
  a = 0
  k = 0
  linkes={}
  links_text.each do |link|
    if  link == "Next >"
       break
    end
    if a >= 18
      if link != ''
        k += 1
        puts (k).to_s + ' ' + link
      else
        puts link
      end

    end
    a += 1
  end
  
a = 0

  links.each do |link|
    if a % 2 == 0
      a+=1
      next
    end
    if /url/.match(link)  
      if /accounts.google/.match(link)
        next
      end
      linkes[a/2] = link
      a+=1
    end
  end
  return linkes
end

