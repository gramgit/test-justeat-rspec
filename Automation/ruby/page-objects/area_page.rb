require 'selenium-webdriver'
require 'page-object'

module Hungry

	class AreaPage
    include PageObject
	
		label(:page_identifier, id: 'searchResultsHeaderInner')
    div(:restaurants, class: 'openRestaurants')
    links(:restaurant_list) { restaurants_element.link_elements(class: 'viewMenu') }
    links(:restaurant_name) { restaurants_element.link_elements(class: 'name') }
		
		def loaded?
			page_identifier? && restaurants?
		end
		
		def heading
			page_identifier
    end
		
		def pick_restaurant(value)
      self.restaurant_name_elements.find { | item |
        item if item.text == value }.find_element(css: 'a').click
		end
	
	end

end