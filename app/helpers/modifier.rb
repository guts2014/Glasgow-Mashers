class Modifier

    attr_reader :modifier
    attr_reader :expires_in

    def initialize modifier, expires_in
        @modifier = modifier
        @expires_in = expires_in
    end

    def apply base
        base * @modifier / 100
    end

end
