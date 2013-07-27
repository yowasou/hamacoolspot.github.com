# encoding: utf-8
require './CsvRead.rb'

describe CsvRead do
  filename = "店舗.csv"
  csvread = CsvRead.new(filename)
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
end
