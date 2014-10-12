class Trait
    
    attr_reader :name, :modifier

    def initialize (name, modifier)
        @name = name
        @modifier = modifier
        @likes = {}
        @hates = {}
    end

    def likes! (trait)
        @likes[trait] = true
    end
    def likes? (trait)
        true if trait == @name
        @likes[trait].nil? ? false : true; 
    end

    def hates! (trait)
        @hates[trait] = true
    end
    def hates? (trait)
        @hates[trait].nil? ? false : true; 
    end

    def self.initialize_traits
        traits = [
            {name: "Perfectionist", mod: 5, likes: [], hates: ["Sloppy", "Lazy"]},
            {name: "Sloppy", mod: -5, likes: ["Lazy"], hates: ["Perfectionist"]},
            {name: "Lazy", mod: -3, likes: ["Sloppy"], hates: ["Perfectionist"]}
        ]
        traits_list = {}
        traits.each do |t|
            tobject = Trait.new t[:name], t[:mod] 
            t[:likes].each { |x| tobject.likes! x }
            t[:hates].each { |x| tobject.hates! x }
            traits_list[tobject.name] = tobject
        end
        traits_list
    end     

end
