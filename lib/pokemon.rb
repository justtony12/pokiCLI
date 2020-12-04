class Pokemon
    attr_accessor :int_id, :name, :height, :weight, :types, :abilities, :forms, :moves
    attr_accessor :stats, :sprites, :species, :location_area_encounters
    attr_accessor :is_default, :held_items, :game_indices, :url
    attr_accessor :base_experience, :id, :order
    @@all = []

    def initialize(attrs)
        set_int_id
        attrs_from_hash(attrs)
        save
    end

    def set_int_id
        @int_id = @@all.length + 1
    end

    def attrs_from_hash(attrs)
        attrs.each do |key, value|
            send("#{key}=", value)
        end
    end

    def self.all
        get_pokemon if @@all == []
        @@all
    end

    def save
        @@all << self
    end

    def self.new_from_collection(pokemon)
        pokemon.each do |attrs|
            new(attrs)
        end
    end

    def self.get_pokemon
        API.get_pokemon_urls
        all
    end

    def self.find_by_id(input)
        all.find{|p| p.int_id == input.to_i}
    end
end