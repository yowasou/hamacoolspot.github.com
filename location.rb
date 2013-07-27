class Location
	attr_accessor :num,:address,:note, :lat, :lng
	def initialize(num,address,note)
		@num = num
		@address = address
		@note = note
	end
end