require 'json'
require 'watir'
require 'pry'
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
#b.goto 'https://eoddata.com/symbols.aspx'
b.goto 'https://eoddata.com/stocklist/NYSE/Z.htm?e=NYSE&l=Z'
#b.goto 'https://eoddata.com/stocklist/NYSE/Z.htm?e=NYSE&l=Z'
tickers = []
binding.pry
#puts "total rows = #{b.table(:class => "wikitable", :index => 2).trs.size}"

counter = 0

b.table(:index=> 4).td(:index => 0).click


for i in (0..25)

  puts "current page = #{b.table(:index=> 4).td(:index => i).text}"

  length = b.table(:index=> 5).trs.size - 1

  for j in (1..length)
      puts "#{b.table(:index=> 5).tr(:index => j).td(:index => 0).text}"
      counter += 1
      tickers << "#{b.table(:index=> 5).tr(:index => j).td(:index => 0).text}"
      #puts "#{counter}"
  end

  b.table(:index=> 4).td(:index => i+1).click if i <= 24

end

puts "total_tickers = #{counter}"
puts "#{tickers}"
