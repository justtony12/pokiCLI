require_relative "../config/environment"
class Pokedex::API
    def initialize
        @url = "https://pokeapi.co/api/v2/pokemon"
    end

    def get_pokemon_urls
        uri = URI.parse(@url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        data["results"].each do |pokemon|
            get_pokemon_data(pokemon["url"])
        end
    end

    def get_pokemon_data(url)
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)
        Pokedex::Pokemon.new(data)
    end
end

