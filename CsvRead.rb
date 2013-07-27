# encoding: utf-8
require 'csv'
require './location'

class CsvRead
	attr_accessor :locations
	def initialize(files)
		@locations = []
		@filename = files
		csvread
		p locations[0].address
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
   			end
   			@locations.push(l)
		end
	end
end