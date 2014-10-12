# require("./person.rb")
# require("./trait_initializer.rb")

AFFLUENCE_LOWER = 500
AFFLUENCE_UPPER = 2000

class CustomerDescriptor < Person
    attr_reader :affluence, :serviced_by
    attr_reader :id
    attr_writer :serviced_by, :affluence, :trait

    def initialize id
        # This shouldn't be like that
        traits = Trait.initialize_traits
        # Actual code
        @name = Faker::Name.last_name
        @trait = traits[traits.keys.sample]
        @affluence = [*AFFLUENCE_LOWER..AFFLUENCE_UPPER].sample
        @serviced_by = nil
        @id = id
    end

    def leave?
        perf = @serviced_by.performance
        (@affluence / 150) > perf
    end

end    
