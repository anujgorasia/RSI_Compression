require 'json'
require 'watir'

#b = Watir::Browser.new :firefox
#b.goto 'https://www.slickcharts.com/sp500'
#tickers = []
#for i in (1..500)
#  puts  b.table.tr(:index => i).td(:index => 2).text
#  tickers << b.table.tr(:index => i).td(:index => 2).text
#end

#puts tickers.to_s
#puts tickers.length
#a = 5
#sleep 15


b = Watir::Browser.new :firefox
b.goto 'https://en.wikipedia.org/wiki/Russell_1000_Index'
tickers1 = []

puts "total rows = #{b.table(:class => "wikitable", :index => 2).trs.size}"

for i in (2..b.table(:class => "wikitable", :index => 2).trs.size-1)
  #puts  b.table(:class => "wikitable", :index => 2).tr(:index => i).td(:index =>1).text
  tickers1 << b.table(:class => "wikitable", :index => 2).tr(:index => i).td(:index =>1).text
end

puts tickers1.to_s
puts tickers1.length
a = 5
sleep 15
