require 'selenium-webdriver'
require 'page-object'

module Hungry

	class HomePage
    include PageObject

		h2(:page_title, class: 'f-display')
		text_field(:my_postcode, id: 'where')
		button(:find_takeaway, id: 'btnSearch')
		select_list(:choose_food_type, id: 'what')
		
		def loaded?
			page_title?
		end

		def search_postcode(value)
			self.my_postcode=value
			find_takeaway
		end
		
		def select_hungry_for(value)
      choose_food_type=value
		end

	end
end
	

