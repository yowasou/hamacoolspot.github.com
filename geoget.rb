# encoding: utf-8
require 'net/http'
require 'json'

def geoget(address)
   address = URI.encode(address)
   hash = Hash.new
   baseUrl = "http://maps.google.com/maps/api/geocode/json"
   reqUrl = "#{baseUrl}?address=#{address}&sensor=false&language=ja"
   response = Net::HTTP.get_response(URI.parse(reqUrl))
   status = JSON.parse(response.body)
   begin
    hash['lat'] = status['results'][0]['geometry']['location']['lat']
    hash['lng'] = status['results'][0]['geometry']['location']['lng']
   rescue
     hash['lat'] = 0
     hash['lng'] = 0
   end
   return hash
end
