require ("./trait.rb")

def initialize_traits
    traits = [
        {name: "Perfectionist", mod: 5, likes: [], hates: ["Sloppy", "Lazy"]},
        {name: "Sloppy", mod: -5, likes: ["Lazy"], hates: ["Perfectionist"]},
        {name: "Lazy", mod: -3, likes: ["Sloppy"], hates: ["Perfectionist"]}
    ]
    traits_list = []
    traits.each do |t|
        tobject = Trait.new t[:name], t[:mod] 
        t[:likes].each { |x| tobject.likes! x }
        t[:hates].each { |x| tobject.hates! x }
        traits_list.push(tobject)
    end
    traits_list
end       
