require 'selenium-webdriver'
require 'page-object'

module Hungry

	class MenuPage
    include PageObject

    ## alternat locators for A/B Testing split switch
    # div(:page_identifier, class: 'menu-container')
    # unordered_list(:products, class: 'menu-category-products')
    # list_item(:menu_item) { products_element.list_item_elements(class: 'addItemButton') }
    # h4(:item_name) { menu_item_element.text_field_element(class: 'item-name') }
    # links(:add_product) { menu_item_element.link_element(class: 'button') }

    ## Menu
    div(:page_identifier, id: 'menu')
    div(:products, class: 'products')
    div(:menu_items) { products_element.div_elements(class: 'product') }
    h4(:item_name) { menu_items.text_field_element(class: 'name') }
    button(:add_product) { menu_items.button_element(class: 'addButton') }
    ## Basket
    unordered_list(:basket, class: 'basketItems')
    list_item(:basket_item) { basket_element.list_item_elements(class: 'basketItem') }


		def loaded?
      page_identifier?
		end

    def add_item(name)
      products_element.div_elements(class: 'product').find { |choice|
        choice.button_element(class: 'addButton').click if choice.text_field_element(class: 'name').text == name
      }
    end

    def basket_item_exists(name)
      result = false
      basket_item_element.each { |item|
        result = true if item.span_element(class: 'basketItemName').text == name
      }
      return result
    end

	
	end

end