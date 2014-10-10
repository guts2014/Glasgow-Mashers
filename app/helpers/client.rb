class Client
    attr_reader :firstName, :lastName, :trait, :affluence

    def initialize
        # This will all be pulled from a DB
        firstNames = ["Peter", "John", "James"]
        lastNames = ["Swanson", "Irons", "Green"]
        traitPerfectionist = Trait.new "Perfectionist", +5
        traitPerfectionist.likes! "Perfectionist"
        traitPerfectionist.hates! "Sloppy"
        traitSloppy = Trait.new "Sloppy", -5
        traitSloppy.likes! "Sloppy"
        traitSloppy.hates! "Perfectionist"
        traitLazy = Trait.new "Lazy", -2
        traits = [traitPerfectionist, traitSloppy, traitLazy]

        # Actual code
        @firstName = firstNames[rand(firstNames.length)]
        @lastName = lastNames[rand(lastNames.length)]
        @trait = traits[rand(traits.length)]
        @affluence = rand(500) + 500;
    end

    def fullName
        @firstName + " " +@lastName
    end

    alias :name :fullName

end    
