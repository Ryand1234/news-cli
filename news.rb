#!/usr/bin/env ruby 
$LOAD_PATH << './lib'
require 'optparse'
require 'ostruct'
require 'internet.rb'
require 'question.rb'
require 'scrap.rb'
options = OpenStruct.new
OptionParser.new do |opt|
  opt.on('-u', '--url URL') { |o| options.url = o }
end.parse!

url = "/search?q=" + options.url + "&client=firefox-b-d&sxsrf=ALeKk00xYJUIgnEj0l5DcBaR7g5pP4eieQ:1586265199950&source=lnms&tbm=nws&sa=X&ved=2ahUKEwipsYyustboAhVCb30KHVHVDYwQ_AUoA3oECBkQBQ&biw=1366&bih=630"
choice = 1

while choice >  0
system "clear"
linkes = link_text(url)
choice = prompt().to_i
if choice == 0
  break
end
news = news_scrap(linkes[choice-1])
puts news
puts "\nPress enter to continue "
gets
system "clear"
end
