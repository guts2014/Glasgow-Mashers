require("./person.rb")
require("./trait_initializer.rb")

AFFLUENCE_LOWER = 500
AFFLUENCE_UPPER = 1000

class CustomerDescriptor < Person
    attr_reader :affluence, :serviced_by
    attr_writer :serviced_by

    def initialize
        # This shouldn't be like that
        traits = initialize_traits
        # Actual code
        @name = Faker::Name.name
        @trait = traits[traits.keys.sample]
        @affluence = [*AFFLUENCE_LOWER..AFFLUENCE_UPPER].sample
        @serviced_by = nil
    end

    def leave?
        (@affluence / 1000) > @serviced_by.performance + [*-50..50].sample
    end

end    
