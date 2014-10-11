require("./person.rb")

INITIAL_BASE_INCOME = 1000

class ManagerDescriptor < Person
    
    attr_reader :email
    attr_writer :name

    def initialize email name
        @email = email
        @name = name
        @baseIncome = INITIAL_BASE_INCOME
        @modifiers = []

    def income
        applyModifiers @baseIncome
    end
            
end 
        

end
