#taking care of displaying info - all of puts/print statements
#taking care of user input - gets

class Pokedex::CLI
    def run
       greeting
       menu

       input = ""

        while input != "exit"
            puts "To choose a Pokemon to learn more about type 'learn'."
            sleep(2)
            puts "To close your Pokedex type 'exit'."

            input = gets.strip

            case input
            when "exit"
            goodbye
            when "learn"
                choose_a_pokemon
            end
        end
    end

    def greeting
        puts "Hi! Welcome to your Pokedex: Please enter your name, trainer."
        name = gets.strip
        puts "Hi ya, #{name}!"
        puts "Fetching your Pokemon now..."
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

    def choose_a_pokemon
        puts "Which Pokemon would you like to learn about?"

        input = gets.strip.to_i
    end

    def goodbye
        puts "See you soon!"
        exit
    end

    def choose_a_pokemon
        puts "Which Pokemon would you like to learn about?"

        input = gets.strip.to_i
        if (1..Pokedex::Pokemon.all.length).include?(input)
            puts "add something here..."
        end
    end
end