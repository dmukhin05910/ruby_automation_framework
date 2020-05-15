require 'logger'
require './pages/actions'

module Page
  module Herokuapp
    class MainPage

      def initialize(browser)
        @browser = browser
        @actions = Page::Actions.new(@browser)
      end

      def open_a_b_page
        @browser.find_element(link_text: "A/B Testing").click
        Page::Herokuapp::ABPage.new(@browser)
      end

      def open_add_remove_elements
        @browser.find_element(link_text: "Add/Remove Elements").click
        Page::Herokuapp::AddRemoveElements.new(@browser)
      end

      def visit
        $logger.info("Visiting main page : http://the-internet.herokuapp.com/")
        @browser.get 'http://the-internet.herokuapp.com/'
      end

      def get_title
        title = @browser.title
        $logger.info("Page title retrieved and is [#{title}]")
        return title
      end

    end
  end
end