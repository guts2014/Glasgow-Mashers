class Person
    attr_reader :name, :trait
    attr_writer :modifiers

    def applyModifiers base
        baseInitial = base
        @modifiers.each do |m|
            base += m.apply(@baseInitial)
        end
        base
    end

end
