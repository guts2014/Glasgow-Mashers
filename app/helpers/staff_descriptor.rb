require ("./person.rb")
require ("./customer_descriptor.rb")
require ("./trait_initializer.rb")
require ("faker")

BASE_PERFORMANCE_LOWER = 5
BASE_PERFORMANCE_UPPER = 10

BASE_HAPPINESS = 70
MINIMAL_HAPPINESS = 20

class StaffDescriptor < Person
    attr_reader :happiness, :salary

    def initialize
        # This shouldn't be like that
        traits = initialize_traits
        # Actual code
        @name = Faker::Name.name
        @trait = traits[traits.keys.sample]
        @basePerformance = [*BASE_PERFORMANCE_LOWER..BASE_PERFORMANCE_UPPER].sample
        @happiness = BASE_HAPPINESS
        # Salary is dependent on trait's modifier + random factor
        @salary = (@trait.modifier.abs + rand(10) + 1) * 5 * 20;
        @modifiers = []
        @customers = []
    end

    def addCustomer customer
        @customers.push(customer)
        customer.serviced_by = self
    end

    def changeSalary new_salary
        @happiness += ((new_salary - salary) / 15)
        @happiness += rand(new_salary / 50) if new_salary > salary
        @happiness -= rand(new_salary / 50) if new_salary < salary
        @salary = new_salary
    end

    # Should be calculated once per day
    def evaluate 
        p = performance
        @happiness -= 10 if p > 1.5 * @basePerformance
        @happiness = applyModifiers @happiness
    end

    def performance
        p = @basePerformance + @happiness / 15
        p += @trait.modifier;
        @customers.each do |c|
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
        p
    end

    def leave?
        @happiness < MINIMAL_HAPPINESS + [*-5..10].sample
    end

    alias :add_customer :addCustomer
    alias :change_salary :changeSalary

end
