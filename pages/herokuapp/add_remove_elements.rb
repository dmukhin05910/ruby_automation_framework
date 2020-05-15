require './pages/herokuapp/main_page'

module Page
  module Herokuapp
    class AddRemoveElements < MainPage
      def get_header
        $logger.info("Retrieving page header information")
        @actions.get_text_from_element(tag_name: "h3")
      end

      def add_element(add_clicks)
        (1..add_clicks).each { |count|
          $logger.info("Adding [#{add_clicks}] Delete element button")
          @actions.click_on_element(xpath: "//div[@id='content']/div/button")
        }
      end

      def delete_element(delete_buttons_count)
        (1..delete_buttons_count).each { |counter|
          $logger.info("Removing [#{delete_buttons_count}] Delete element button")
          @actions.click_on_element(xpath: "//div[@id='elements']/button[#{counter}]")
        }
      end

      def get_delete_elements_count
        $logger.info("Receiving Delete elements count")
        @actions.get_elements_count(xpath: "//div[@id='elements']/button")
      end
    end
  end
end