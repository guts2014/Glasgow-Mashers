require ("./client.rb")
require ("faker")

BASE_PERFORMANCE_LOWER = 5
BASE_PERFORMANCE_UPPER = 10

class StaffMember
    attr_reader :name, :trait

    def initialize
        # This will all be pulled from a DB
        traitPerfectionist = Trait.new "Perfectionist", +5
        traitPerfectionist.likes! "Perfectionist"
        traitPerfectionist.hates! "Sloppy"
        traitSloppy = Trait.new "Sloppy", -5
        traitSloppy.likes! "Sloppy"
        traitSloppy.hates! "Perfectionist"
        traitLazy = Trait.new "Lazy", -3
        traits = [traitPerfectionist, traitSloppy, traitLazy]

        # Actual code
        @name = Faker::Name.name
        @trait = traits[rand(traits.length)]
        @basePerformance = [*BASE_PERFORMANCE_LOWER..BASE_PERFORMANCE_UPPER].sample
        @clients = []
    end

    def add_client client
        @clients.push(client)
    end

    # Should be calculated once per day
    def performance
        p = @basePerformance
        p += @trait.modifier;
        @clients.each do |c|
           if @trait.modifier < 0 
            p -= 2 * @trait.modifier if c.trait.likes? @trait
            p += 2 * @trait.modifier if c.trait.hates? @trait
           end
           if @trait.modifier > 0
            p -= 2 * @trait.modifier if c.trait.hates? @trait
            p += 2 * @trait.modifier if c.trait.likes? @trait
           end
        end
        p += rand(5) + -2;
    end

end
