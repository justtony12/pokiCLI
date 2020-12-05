  
class CLI
    
    def play
        greeting
        list_pokemon
        
        while @input != "exit"
            get_input
            validate(@input)
        end
        goodbye
    end

    def greeting
        puts <<-'EOF'.colorize(:red).bold

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

        puts "Hello, what's your name?".colorize(:blue).bold
        name = gets.strip
        puts "Hi ya, #{name}!".colorize(:yellow).bold
        sleep(1)
        puts "Lets see all your pokemon!".colorize(:blue).bold
        sleep(1)

        puts <<-'EOF'.colorize(:green).bold

                 _                          _  _                        
                (_)                        | |(_)                       
                 _         ___   _____   __| | _  ____    ____          
                | |       / _ \ (____ | / _  || ||  _ \  / _  |         
                | |_____ | |_| |/ ___ |( (_| || || | | |( (_| | _  _  _ 
                |_______) \___/ \_____| \____||_||_| |_| \___ |(_)(_)(_)
                                                        (_____|           

        EOF

        API.new.get_pokemon_urls
    end

    def list_pokemon
        Pokemon.all.each{|p| puts "#{p.int_id}. #{p.name}"}
        sleep(1)
        puts "Choose a number from 1-10 to learn more about your Pokemon.".colorize(:blue).bold
        sleep(1)
        puts "To close Pokedex type 'exit'.".colorize(:red).bold
    end

    def get_input
        @input = gets.strip

        case @input
        when "exit"
            goodbye
        when "menu"
            list_pokemon
        end
    end

    def validate(input)
        pokemon = Pokemon.find_by_id(input)
        pokemon ? show_pokemon_info(pokemon) : invalid_input
    end

    def invalid_input
        puts "NOPE! Try agin!.".colorize(:red).bold
        sleep(2)
        list_pokemon
    end

    def show_pokemon_info(pokemon)

        Pokemon.look_at_me(@input)
        puts "Name: #{pokemon.name.capitalize}".colorize(:blue).bold
        puts "Height: #{pokemon.height}".colorize(:blue).bold
        puts "Weight: #{pokemon.weight}".colorize(:blue).bold
        puts "Base XP: #{pokemon.base_experience}".colorize(:blue).bold
        sleep(1)
        puts "To go back to your list of pokemon type 'menu' or to exit type 'exit'."
        get_input
    end

    def goodbye
        puts "See you soon!".colorize(:red).bold

        puts <<-'EOF'.colorize(:yellow).bold
            
                                              ,'\                               
                _.----.        ____         ,'  _\   ___    ___     ____        
            _,-'       `.     |    |  /`.   \,-'    |   \  /   |   |    \  |`.  
            \      __    \    '-.  | /   `.  ___    |    \/    |   '-.   \ |  | 
             \.    \ \   |  __  |  |/    ,','_  `.  |          | __  |    \|  | 
               \    \/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  | 
                \     ,-'/  /   \    ,'   | \/ / ,`.|         /  /   \  |     | 
                 \    \ |   \_/  |   `-.  \    `'  /|  |    ||   \_/  | |\    | 
                  \    \ \      /       `-.`.___,-' |  |\  /| \      /  | |   | 
                   \    \ `.__,'|  |`-._    `|      |__| \/ |  `.__,'|  | |   | 
                    \_.-'       |__|    `-._ |              '-.|     '-.| |   | 
                                            `'                            '-._| 

        EOF
        exit
    end
end