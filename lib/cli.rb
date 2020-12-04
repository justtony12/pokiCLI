  
class CLI
    def run
        while @input != "exit"
            greeting
            list_pokemon
            get_input
            validate(@input)
            options
        end
        goodbye
    end

    def greeting
        puts "Hi! Welcome to your Pokedex: Please enter your name, trainer."
        name = gets.strip
        puts "Hi ya, #{name}!"
        puts "Fetching your Pokemon now..."
        API.new.get_pokemon_urls
    end

    def list_pokemon
        Pokemon.all.each{|p| puts "#{p.int_id}. #{p.name}"}
        sleep(1)
        puts "Choose a number from 1-10."
    end

    def get_input
        @input = gets.strip
    end

    def validate(input)
        pokemon = Pokemon.find_by_id(input)
        pokemon ? show_pokemon_info(pokemon) : invalid_input
    end

    def show_pokemon_info(pokemon)
        puts "Name: #{pokemon.name.capitalize}"
        puts "Height: #{pokemon.height}"
        puts "Weight: #{pokemon.weight}"
    end

    def invalid_input
        puts "That is not a valid number, please choose a number form 1-10."
        sleep(1)
    end

    def options
        puts "Would you like to see your list of pokemon again?"
        get_input
    end

    def goodbye
        puts "See you soon!"
        exit
    end
end