# encoding: utf-8

class HtmlFormatter
  attr_accessor :text, :replaceorig
  def initialize
    @replaceorig = "<% initarray %>"
  end
  def read(filename)
    f = open(filename)
    s = f.read
    f.close
    @text = s
    return s
  end
  def replace(rep)
    @text = @text.gsub(@replaceorig,rep)
    return @text
  end
end