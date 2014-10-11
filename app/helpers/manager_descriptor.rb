require("./person.rb")

INITIAL_BASE_INCOME = 3000

class ManagerDescriptor < Person
    
    attr_reader :email, :money, :baseIncome, :name, :staff
    attr_writer :name, :baseIncome

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
            exp += x.salary
        end
        exp
    end 

    def hire staff
        @staff.push(staff)
    end

    def fire staff
        @staff.delete(staff)
    end
            
end 
