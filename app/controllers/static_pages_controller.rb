class StaticPagesController < ApplicationController
	def welcome_page
		@all_traits = Trait.all
		
	end
end
