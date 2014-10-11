AFFLUENCE_LOWER = 500
AFFLUENCE_UPPER = 1000

class Client
    attr_reader :name, :trait, :affluence

    def initialize
        # This will all be pulled from a DB
        traitPerfectionist = Trait.new "Perfectionist", +5
        traitPerfectionist.likes! "Perfectionist"
        traitPerfectionist.hates! "Sloppy"
        traitSloppy = Trait.new "Sloppy", -5
        traitSloppy.likes! "Sloppy"
        traitSloppy.hates! "Perfectionist"
        traitLazy = Trait.new "Lazy", -2
        traits = [traitPerfectionist, traitSloppy, traitLazy]

        # Actual code
        @name = Faker::Name.name
        @trait = traits[rand(traits.length)]
        @affluence = [*AFFLUENCE_LOWER..AFFLUENCE_UPPER].sample
    end

end    
