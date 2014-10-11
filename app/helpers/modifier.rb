class Modifier

    attr_reader :modifier

    def initialize modifier
        @modifier = modifier
    end

    def apply base
        base * @modifier / 100
    end

end
