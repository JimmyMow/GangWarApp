class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



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

end
