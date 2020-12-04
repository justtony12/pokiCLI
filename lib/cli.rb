  
class CLI
    # @@muted="\e[1;31m"
    # @@grn="\e[1;32m"
    # @@blu="\e[1;34m"
    # @@mag="\e[1;35m"
    # @@cyn="\e[1;36m"
    # @@white="\e[0m"

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
        puts <<-'EOF'.colorize(:red).on_black

                    _  _  _         _                               _                          
                    (_)(_)(_)       | |                             | |                        
                     _  _  _  _____ | |   ____   ___   ____   _____ | |                        
                    | || || || ___ || |  / ___) / _ \ |    \ | ___ ||_|                        
                    | || || || ____|| | ( (___ | |_| || | | || ____| _                         
                     \_____/ |_____) \_) \____) \___/ |_|_|_||_____)|_|                        
                                                                                               
                                           _                                                   
                                         _| |_   ___                                           
                                        (_   _) / _ \                                          
                                          | |_ | |_| |                                         
                                           \__) \___/                                          
            _     _                         ______          _                 _                
            | |   | |                       (_____ \        | |               | |              
            | |___| |  ___   _   _   ____    _____) )  ___  | |  _  _____   __| | _____  _   _ 
            |_____  | / _ \ | | | | / ___)  |  ____/  / _ \ | |_/ )| ___ | / _  || ___ |( \ / )
            _____| || |_| || |_| || |      | |      | |_| ||  _ ( | ____|( (_| || ____| ) X (  
            (_______| \___/ |____/ |_|      |_|       \___/ |_| \_)|_____) \____||_____)(_/ \_)
        EOF

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
        puts "Base XP: #{pokemon.base_experience}"
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