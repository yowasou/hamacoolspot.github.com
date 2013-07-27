require './geoget'

class Location
	attr_accessor :num,:address,:note, :lat, :lng
	def initialize(num,address,note)
		@num = num
		@address = address
		@note = note
		@note = @note.gsub("'","")
		@lat = 0
		@lng = 0
	end
	def geoload
	  h = geoget(@address)
    @lat = h['lat']
    @lng = h['lng']
	end
end