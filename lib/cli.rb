#taking care of displaying info - all of puts/print statements
#taking care of user input - gets
class Pokedex::CLI
    def run
       greeting
       list_pokemon
       menu
       goodbye
    end

    def greeting
        puts "Hi! Welcome to your Pokedex: Fetching all pokemon now..."
        Pokedex::API.new.get_pokemon_urls
    end

    def menu
        list_pokemon
    end

    def list_pokemon
        Pokedex::Pokemon.all.each.with_index(1) do |pokemon, i|
            puts "#{i}. #{pokemon.name}"
        end
    end

    def goodbye
        puts "See you soon!"
        exit
    end
end