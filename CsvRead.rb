# encoding: utf-8
require 'csv'
require './location'
require './htmlformatter'

class CsvRead
	attr_accessor :locations
	def initialize(files)
		@locations = []
		@filename = files
		csvread
		geoset
	end
	def write(filename)
	  h = HtmlFormatter.new
    h.read("template.html")
    h.replace(javacodes)
    open( filename , "w" ){|f| f.write(h.text)}
	end
	def javacodes
	  s = ""
	  @locations.each{|l|
      s = s + "l = new Array();" + 
        "l[\"lat\"] = " + l.lat.to_s + ";" + 
        "l[\"lng\"] = " + l.lng.to_s + ";" + 
        "l[\"title\"] = '" + l.note + "';" + 
        "la.push(l);" + "\n"  
     }
    return s
	end
	def csvread
		i = 0
		CSV.foreach(@filename, :col_sep => "\t") do |row|
			i = i + 1
			if i == 1 then
				next
			end
			if row[2] != nil then
   				l = Location.new(row[0],"静岡県浜松市" + row[2].gsub("浜松市",""),row[2] + "," + row[1])
   			 @locations.push(l)
   	  end
		end
	end
	def geoset
	  @locations.each{|l|
      l.geoload  
      sleep(0.1)
	  }
	end
end

filename = "店舗.csv"
csvread = CsvRead.new(filename)
csvread.write("map.html")
