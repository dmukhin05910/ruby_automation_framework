require './pages/herokuapp/main_page'

module Page
  module Herokuapp
    class ABPage < MainPage
      def get_header
        $logger.info("Retrieving page header information")
        @actions.get_text_from_element(tag_name: "h3")
      end
    end
  end
end
