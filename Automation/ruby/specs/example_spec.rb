require 'rspec'
require 'selenium-webdriver'
require_relative '../spec_helper.rb'


describe 'Given I want food in #{"AR51 1AA"}' do

	before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = 'http://www.just-eat.co.uk/'
    @driver.get(@base_url)
    @driver.manage.window.maximize
		@home = Hungry::HomePage.new(@driver)
    @area = Hungry::AreaPage.new(@driver)
    @menu = Hungry::MenuPage.new(@driver)
		@home.loaded?
  end

  after(:all) do
    @driver.quit
  end

	context 'When I search for restaurants' do
	
		before(:all) do
			@home.search_postcode 'AR51 1AA'
			@area.loaded?
		end
	
		it 'Then I should see some restaurants in #{"AR51 1AA"}' do
			@area.restaurant_list_elements.length.should_not be_zero
    end

    it 'Then I can pick a specific restaurant' do
      @area.pick_restaurant 'William DEMO2'
      @menu.should be_loaded
    end

    context 'When I add a select some food' do

      it 'Then the selected menu item is reflected in the basket' do
        # add a product
        @menu.add_item 'Chicken Burger'
        # assert the chosen item is in the basket
        @menu.basket_item_exists('Chicken Burger').should be_true
      end

    end
	
	end

end