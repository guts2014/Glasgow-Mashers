require("./person.rb")
require("./trait_initializer.rb")

AFFLUENCE_LOWER = 500
AFFLUENCE_UPPER = 1000

class Client < Person
    attr_reader :affluence

    def initialize
        # This shouldn't be like that
        traits = initialize_traits
        # Actual code
        @name = Faker::Name.name
        @trait = traits[rand(traits.length)]
        @affluence = [*AFFLUENCE_LOWER..AFFLUENCE_UPPER].sample
    end

end    
