require("./modifier.rb")

IGNORE_OPTION_TEXT = "OK"
TYPE_EQ = "="
TYPE_GT = ">"
TYPE_LT = "<"

class EventOption

    attr_reader :text, :modifier

    def initialize text, modifier
        @text = text
        @modifier = modifier 
    end

end

class EventCondition

    attr_reader :property, :type, :value

    def initialize property, type, value
        @property = property
        @type = type
        @value = value
    end

    def applies? target
        if type == TYPE_EQ
            return eval("target"+"."+@property) == @value
        end
        if type == TYPE_GT
            return eval("target"+"."+@property) > @value
        end
        if type == TYPE_LT
            return eval("target"+"."+@property) < @value
        end
        return false
    end

end
class EventDescriptor

    attr_accessor :name, :desc, :target, :conditions, :chance, :options

    def initialize name, desc, target
        @name = name
        @desc = desc
        @target = target
        @options = ignoreOption
        @conditions = nullConditions
        @chance = 0
    end

    def ignoreOption
        a = Array.new
        a.push(EventOption.new IGNORE_OPTION_TEXT, Modifier.new(0))
        return a
    end

    def nullConditions
        []
    end

    def occurs?
        @conditions.each do |c|
            return false if not c.applies? @target
        end
        rand(@chance) + 1 == @chance
    end

    def apply option
        @target.add_modifier option.modifier if occurs? and @options.include? option
    end
    
end

