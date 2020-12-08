class API
    def initialize
        @url = "https://pokeapi.co/api/v2/pokemon?limit=10/"
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
        Pokemon.new(data)
    end
end

# class API
#     def self.get_pokemon_urls
#         response = HTTParty.get("https://pokeapi.co/api/v2/pokemon?limit=10/")
#         response["results"].each do |pokemon|
#             get_pokemon_data(pokemon["url"])
#         end
#     end

#     def self.get_pokemon_data(url)
#         response = HTTParty.get("https://pokeapi.co/api/v2/pokemon?limit=10/")
#         Pokemon.new(response)
#     end
# end
