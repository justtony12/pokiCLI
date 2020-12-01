class Pokedex::Pokemon
    @@all = []
    def initialize(pokemon_hash)
        pokemon_hash.each do |key, value|
            self.class.attr_accessor key
        self.send("#{key}=", value)
        end
        @@all << self
    end

    def self.all
        @@all
    end
end