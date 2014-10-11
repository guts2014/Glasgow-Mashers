# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


trait_list = [
	["Perfectionist", 5],
	["Sloppy", -5],
	["Lazy", -3]
]

traits_list_likes = [
	["Sloppy", "Lazy"],
	["Lazy", "Sloppy"]
]

traits_list_hates = [
	["Perfectionist", "Sloppy"],
	["Perfectionist", "Lazy"]
]

trait_list.each do |type, modifier|
	Trait.create(name: type, modifier: modifier)
end

traits_list_hates.each do |who, hates|
	TraitHate.create(who_hates: who, what_hates: hates)
end

traits_list_likes.each do |who, likes|
	TraitLike.create(who_likes: who, what_likes: likes)
end

