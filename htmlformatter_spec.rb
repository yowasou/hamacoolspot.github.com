# encoding: utf-8

require './htmlformatter'
# HtmlFormatterクラスのテスト
describe HtmlFormatter do
  filename = "template.html"
  f = HtmlFormatter.new
  s = f.read("template.html")
  context "new?" do
    it {f.should_not == nil}
  end   
  context "read?" do
    it {s.length.should > 5}
  end   
  context "replace?" do
    it {f.replace("ooo").index("ooo").should_not == nil}
  end   
  #context "配列になってる？" do
  #  it {csvread.locations.size.should >= 0}
  #end
end