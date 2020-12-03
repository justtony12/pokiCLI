#taking care of displaying info - all of puts/print statements
#taking care of user input - gets

class Pokedex::CLI
    def run
       greeting
       menu

       input = ""

        while input != "exit"
            puts "Which Pokemon would you like to learn more about?"
            puts "Choose a number from 1-20!"
            puts "To close your Pokedex type 'exit'."

            input = gets.strip
            case input
            when "exit"
            goodbye
            end
        end
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