class Person
    attr_reader :name, :trait
    attr_reader :modifiers

    def applyModifiers base
        baseInitial = base
        @modifiers.each do |m|
            base += m.apply(baseInitial)
        end
        base
    end

    def addModifier modifier
        @modifiers.push(modifier)
    end

    alias :add_modifier :addModifier

end
