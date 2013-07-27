# encoding: utf-8
require './CsvRead.rb'

describe CsvRead do
  filename = "店舗.csv"
  csvread = CsvRead.new(filename)
  csvread.write("map.html")
  context "readed" do
    #subject { stablemarriage.match(male,female) }
    #it {should == [["1","a"],["2","c"],["3","b"],["4","d"]]}
  end   
  context "配列になってる？" do
  	it {csvread.locations.size.should >= 0}
  end
  context "1件以上読み込んでる？" do
  	it {csvread.locations.size.should >= 1}
  end 
  context "1件目住所の緯度経度" do
    csvread.locations[0].geoload      
    it {csvread.locations[0].lat.to_f > 1}
  end
end
