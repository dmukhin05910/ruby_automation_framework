module Page
  class Actions
    def initialize(browser)
      @browser = browser
    end

    def click_on_element(element)
      $logger.info("Click on element [#{element}]")
      @browser.find_element(element).click
    end

    def get_text_from_element(element)
      $logger.info("Receiving text from element [#{element}]")
      text = @browser.find_element(element).text
      $logger.info("Received text is [#{text}]")
      return text
    end

    def get_elements_count(element)
      $logger.info("Receiving count of elements [#{element}]")
      count = @browser.find_elements(element).count
      $logger.info("Count is [#{count}]")
      return count
    end
  end
end
