class TraitDescription

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
        @likes[trait].nil? ? false : true; 
    end

    def hates! (trait)
        @hates[trait] = true
    end
    def hates? (trait)
        @hates[trait].nil? ? false : true; 
    end

    

end
