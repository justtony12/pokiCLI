require_relative "../config/environment"
class API
    # def initialize
    #     @url = "https://pokeapi.co/api/v2/pokemon?limit=10/"
    # end

    # def get_pokemon_urls
    #     uri = URI.parse(@url)
    #     response = Net::HTTP.get(uri)
    #     data = JSON.parse(response)
    #     data["results"].each do |pokemon|
    #         get_pokemon_data(pokemon["url"])
    #     end
    # end

    # def get_pokemon_data(url)
    #     uri = URI.parse(url)
    #     response = Net::HTTP.get(uri)
    #     data = JSON.parse(response)
    #     Pokemon.new(data)
    # end

    response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=10/')
    pokemon = response["results"] #here I want to get my specific info for each pokemon...
    Pokemon.new_from_collection(pokemon)

    #the code above works and is a easier/cleaner way to to the API class using HTTParty.
    #ask Laura if it's ok for me to use this gem?
end

