require 'selenium-webdriver'
require 'webdrivers'
require 'allure-cucumber'
require_all './pages/herokuapp'

screenshots_is_removed = false
is_browser_created = false

#Delete all screenshots
Before('@ui_case') do
  unless screenshots_is_removed
    $logger.info('Removing existed screenshots')
    Dir.foreach("report/scr") do |f|
      fn = File.join("report/scr", f)
      File.delete(fn) if f != '.' && f != '..'
    end
    screenshots_is_removed = true
  end
end

Before('@ui_case') do |scenario|
  $logger.info("UI_SCENARIO: \"#{scenario.name}\"")
#UI setting
  @browser = YAML.load(File.open("config/browser.yaml"))
  unless is_browser_created
    $remote_caps_log = nil
    @remote = @browser["remote"]
    @selenoid_url = "http://#{@remote["host"]}:#{@remote["port"]}/#{@remote["base_path"]}"
    @remote_caps = Selenium::WebDriver::Remote::Capabilities.new
    @remote_caps[:enableVNC] = @remote["enable_vnc"]
    @remote_caps[:enableVideo] = @remote["enable_video"]

#Webdrivers setting
    Webdrivers.install_dir = 'drivers'

#Init webdrivers
    if ($env["remote"])
      case $env["browser"]
      when :chrome
        #Set chrome capabilities
        @remote_caps[:browser_name] = "chrome"
        @remote_caps[:version] = @remote["chrome"]["version"]
        #init chrome webdriver
        $driver = Selenium::WebDriver.for(:remote,
                                          :url => @selenoid_url,
                                          :desired_capabilities => @remote_caps)
      when :firefox
        #Set ff capabilities
        @remote_caps[:browser_name] = "firefox"
        @remote_caps[:version] = @remote["firefox"]["version"]
        #init ff webdriver
        $driver = Selenium::WebDriver.for(:remote,
                                          :url => @selenoid_url,
                                          :desired_capabilities => @remote_caps)
      else
        $logger.error 'Your remote driver not yet implemented'
        raise "Your remote driver not yet implemented"
      end
    else
      case $env["browser"]
      when :chrome
        #Download chrome webdriver
        Webdrivers::Chromedriver.required_version = @browser["drivers"]["chrome"]["version"]
        Webdrivers::Chromedriver.update
        #init chrome webdriver
        Selenium::WebDriver::Chrome::Service.driver_path = self.mac? ? "drivers/chromedriver" : "drivers/chromedriver.exe"
        $driver = Selenium::WebDriver.for(:chrome)
      when :firefox
        #Download ff webdriver
        Webdrivers::Geckodriver.required_version = @browser["drivers"]["firefox"]["version"]
        Webdrivers::Geckodriver.update
        #init ff webdriver
        Selenium::WebDriver::Firefox::Service.driver_path = self.mac? ? "drivers/geckodriver" : "drivers/geckodriver.exe"
        $driver = Selenium::WebDriver.for(:firefox)
      else
        $logger.error 'Your remote driver not yet implemented'
        raise "Your local driver not yet implemented"
      end
    end
#Init timeouts
    @waits = $env["waits"]
    $driver.manage.timeouts.implicit_wait = @waits["implicit_wait"]
    $driver.manage.timeouts.script_timeout = @waits["script_timeout"]
    $driver.manage.timeouts.page_load = @waits["page_load"]
    $wait = Selenium::WebDriver::Wait.new(timeout: @waits["explicit_wait"])

#Init base pages
    $main_page = Page::Herokuapp::MainPage.new($driver)
    is_browser_created = true

    at_exit do
      $driver.quit if $driver
    end
  end

  $remote_caps_log = $remote_caps_log.nil? ? @remote_caps.to_yaml : $remote_caps_log

  if ($env["remote"])
    $logger.info("Browser #{$env["browser"]} remote session")
    $logger.info("Remote URL : #{@selenoid_url}")
    $logger.info("Capabilities :\n #{$remote_caps_log}")
  else
    $logger.info("Browser #{$env["browser"]} local session")
    $logger.info("Capabilities :\n #{@browser["drivers"][$env["browser"].to_s].to_yaml}")
  end
end

Before('@ui_case') do
  $herokuapp_asserts = Assertions::Herokuapp::HerokuappAsserts.new
end

#Make screenshot on failure
After('@ui_case') do |scenario|
  @browser = $driver
  if scenario.failed?
    @scenario_name = scenario.name
    @browser.save_screenshot("report/scr/#{@scenario_name}_error.png")
    Allure.add_attachment(name: "#{@scenario_name}_error",
                          source: File.open("report/scr/#{@scenario_name}_error.png"),
                          type: Allure::ContentType::PNG,
                          test_case: true)
  end
end

def windows?
  (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
end

def mac?
  (/darwin/ =~ RUBY_PLATFORM) != nil
end



