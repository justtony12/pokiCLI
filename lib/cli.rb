class CLI
    def run
       greeting
       list_pokemon

       input = ""

        while input != "exit"
            puts "To choose a Pokemon to learn more about type 'learn'."
            sleep(1)
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
        API.new.get_pokemon_urls
    end

    def list_pokemon
        Pokemon.all.each.with_index(1) do |pokemon, i|
            puts "#{i}. #{pokemon.name}"
        end
    end

    def goodbye
        puts "See you soon!"
        exit
    end

    def choose_a_pokemon
        puts "Which Pokemon would you like to learn about?"

        input = gets.strip.to_i
        if (1..Pokemon.all.length).include?(input)

        else
            puts "That is not a valid number, please choose a number from 1-10."
            sleep(1)
        end
        
        puts "Type 'menu' to return to your list of Pokemon!"
        input = gets.strip

        case input
        when "menu"
        list_pokemon
        end

    end
end