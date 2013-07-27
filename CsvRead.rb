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
		#geoset
		h = HtmlFormatter.new
		h.read("template.html")
		h.replace(javacodes)
		puts h.text
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
   				l = Location.new(row[0],"静岡県浜松市" + row[2],row[1])
   			 @locations.push(l)
   	  end
		end
	end
	def geoset
	  @locations.each{|l|
      l.geoload  
	  }
	end
end