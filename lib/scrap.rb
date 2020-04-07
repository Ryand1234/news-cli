require 'nokogiri'
require 'net/http'
require 'uri'
def news_scrap(url)
  page = Net::HTTP.get("www.google.com",url)
  links = Nokogiri::HTML(page)
  new_page = links.css("a").map{|link| link["href"]}
  uri = URI.parse(new_page[0]) 

  http = Net::HTTP.new(uri.host, uri.port) 
  http.use_ssl = true

  request = Net::HTTP::Get.new(uri.request_uri) 
  request['X-Token'] = "obfuscated-APIToken" 
  request['Accept'] = "application/json"

  response = http.request(request)
  news_page = Nokogiri::HTML(response.body)
  news_scrap = news_page.css("div").css("p").map{|txt| txt.text}
  return news_scrap
end
