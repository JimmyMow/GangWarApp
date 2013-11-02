require 'open-uri'
require 'json'

require 'open-uri'
require 'json'

def chicago_crime
  url_string = open('http://data.cityofchicago.org/resource/ijzp-q8t2.json').read
  array = JSON.parse(url_string)
  location_crimes = []
  array.each do |crime|
   keys = crime.keys
    if keys.include?('location')
      location_crimes << crime
    end
  end
crime_array = []
 location_crimes.each do |crime|
  crime_hash = {'name' =>'', 'block' => '', 'lat' => '', 'long' => ''}

    crime_hash['name'] = crime['primary_type']
    crime_hash['block'] = crime['block']
    crime_hash['location_description'] = crime['location_description']
    crime_hash['date'] = crime['date']
    test_hash = crime['location']
    long = test_hash['longitude']
    crime_hash['long'] = long
    lat = test_hash['latitude']
    crime_hash['lat'] = lat
    crime_array << crime_hash

  end
  return crime_array
end
crime_array = chicago_crime

crime_array.each do |crime|
  c = Crime.new
  c.description = crime['name']
  c.date = crime['date']
  c.location_description = crime['location_description']
  c.block = crime['block']
  c.latitude = crime['lat']
  c.longitude = crime['long']
  c.save
end
