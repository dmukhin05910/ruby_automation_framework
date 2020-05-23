require 'allure-cucumber'

#Load all Allure configs
@allure = YAML.load(File.open("config/allure.yaml"))
#Configure Allure for Cucumber
AllureCucumber.configure do |c|
  c.results_directory = 'report/allure-results'
  c.clean_results_directory = true
  c.logging_level = Logger::INFO
  c.link_tms_pattern = @allure["tms_link"]
  c.link_issue_pattern = @allure["issue_link"]
  c.tms_prefix = @allure["tms_prefix"]
  c.issue_prefix = @allure["issue_prefix"]
end


#Remove old allure results
Around() do |scenario,block|
  unless @allure_is_removed
    $logger.info("Removing old Allure report")
    if (Dir.exist?("allure-report"))
      FileUtils.rm_rf("allure-report")
    end
    @allure_is_removed = true
  end
  block.call
end

#Generate Allure report
at_exit do
  exec("allure generate report/allure-results")
end