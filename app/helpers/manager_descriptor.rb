# require("./person.rb")

INITIAL_BASE_INCOME = 3000

class ManagerDescriptor < Person
    
    attr_reader :email, :baseIncome, :name, :staff
    attr_writer :name, :baseIncome
    attr_accessor :money

    def initialize email, name
        @email = email
        @name = name
        @baseIncome = INITIAL_BASE_INCOME
        @modifiers = []
        @money = 0
        @staff = []
    end

    def income
        applyModifiers @baseIncome
    end

    def expenses
        exp = 0
        @staff.each do |x|
            exp += x.salary / 2 + [*0..230].sample
        end
        exp
    end 

    def money
        @money = @money + income - expenses
    end

    def hire staff
        @staff.push(staff)
    end

    def fire staff
        @staff.delete(staff)
    end
            
end 
