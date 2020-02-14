from googleplaces import GooglePlaces, types, lang

API_KEY = 'AIzaSyAGjmG9PGwTVhNsMOzTIe7hEI6HnYhJDJA'

import requests,json

# google_places = GooglePlaces(API_KEY)

# query_result = google_places.nearby_search(
#     lat_lng={'lat':15.2993, 'lng':74.1240}, keyword='tourist_attraction',
#     radius=200000)

# if query_result.has_attributions:
#    print(query_result.html_attributions)


# for place in query_result.places[:5]:
#     print(place.name)
#     print(place.geo_location)
#     print(place.place_id)
#     #place.get_details()
#     #print(place.rating)
  
url = "https://maps.googleapis.com/maps/api/place/textsearch/json?"

query = "Goa+tourist+attractions"



r = requests.get(url + 'query=' + query + '&key=' + API_KEY)

# file = open('./data/places.json',"w+")

# file.write(r.json())
# file.close()

print(r.json())


