# ruby_automation_framework
This is a behavior driven automation framework, written on Ruby and Gherkin,  
implemented by cucumber, that include API and UI tests, that are pattern  oriented

# Required gems 
As Test Runner gems have been used:
```ruby
gem 'cucumber', '~> 4.0.0.rc.6'
gem 'multi_json', '~> 1.14', '>= 1.14.1'
gem 'parallel_tests', '~> 2.32'
```
For UI testing have been used gems:  
```ruby
gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
gem 'webdrivers', '~> 4.3'
```
For API testing have been used gems:
```ruby
gem 'faraday', '~> 1.0', '>= 1.0.1'
gem 'oj', '~> 3.10', '>= 3.10.6'
gem 'virtus', '~> 1.0', '>= 1.0.5'
```
For Assertion have been used gems:
```ruby
gem 'rspec', '~> 3.9'
```
For Reporting have been used gems:
```ruby
gem 'allure-cucumber', '~> 2.13', '>= 2.13.4'
gem 'logger', '~> 1.4', '>= 1.4.2'
```

# Project tree 
```ruby
ruby_automation_framework/
├── assertions/
│   |── httpbin/      #Assertions for API tests
│   |── webSDK/       #Assertions for UI tests
│   |── base_api_asserts.rb #Base API assertion templates
│   |── base_asserts.rb     #RSpec initializing and base assertion templates
│   |── base_ui_asserts.rb  #Base UI assertion templates
├── config/
│   |── allure.yaml         #Allure-report configurations
│   |── browser.yaml        #Selenium configurations
│   |── cucumber.yaml       #Cucumber formatter config for allure-reporting
│   |── env.yaml            #Main constants for each tests running
│   |── resolutions.yaml    #Screen resolutions for UI tests
│   └── servers.yaml        #Server links for different environments
├── features/  
│   └── support/  
|       |──allure.rb        #Allure initializing , old report deletion and generation new
|       |──env.rb           #Tests require and global test constants init
|       |──logger_hooks.rb  #Logger initializing with creation all nessesary folders
|       |──service_hooks.rb #Tests endpoints initializing
|       └──ui_hooks.rb      #Web driver initializing with failed tests screen saver
│   └── tests/
│       |── httpbin/  #API tests
│       └── webSDK/   #UI tests 
├── pages/  
│   |── webSDK/       #Page Object patter pages for webSDK tests
│   |── actions.rb          # Wrapped selenium actions with logged 
│   └── base_page.rb        # Base object for each page extending from with methods which can be used on each page 
├── service/  
│   └── endpoints/ 
│       └── httpbin/
│           └── httpbin_endpoint.rb # Endpoint implementation for API tests using https://httpbin.org/ 
│   └── models/ 
│       └── objects/  #DTO pattern
│           |── httpbin/   
│               |── post/   # DTOs for post endpoint including builder pattern for Actors and Role classes
│               |── base_httpbin.rb # Base httpbin DTO
│               └── uuid.rb         # DTO for uuid endpoint
│           └── base.rb     # Base DTO object
├── .gitignore 
├── Gemfile  
├── Gemfile.lock  
└── README.md
```

# How to run tests  
## Preconditions  
### Install project gems
Install project gems using  
```ruby
bundle install
```
### Install Selenoid and Selenoid-ui (OPTIONAL)
### Confige Allure.yaml
Set your allure data in [Allure file](config/allure.yaml).  
Details: [Allure_cucumber](https://github.com/allure-framework/allure-ruby/blob/master/allure-cucumber/README.md)
### Configure Browsers.yaml
Set your browser data in [Browser file](config/browser.yaml).  
Version of chrome and/or firefox for local execution or remote data for remote execution.  
Remote data:  
`host` - selenoid host  
`port` - selenoid port  
`base_path` - selenoid base path (As usual : `wd/hub`)  
`enable_vnc` - is need to show current execution screen on selenoid-ui (true/false)  
`enable_video` - is need to record test runs (true/false)  
`firefox.version` - version of firefox remote driver (available 75.0 and 76.0)  
`chrome.version` - version of chrome remote driver (available 81.0 and 80.0)  
### Configure env.yaml
Set your project data in [Env file](config/env.yaml):  
`browser` - browser for UI tests execution (now implemented only `:firefox` and `:chrome`)  
`remote` - is need to run remote using selenoid  
`waits` - selenium waits  
## Tests running in parallel
To execute tests in parallel use command:
```cmd
bundle exec parallel_cucumber features/ -n 6 -o '-t  "@api_case or @ui_case" --format pretty --format AllureCucumber::CucumberFormatter --out report/allure-results'
```
when  
`@api_case or @ui_case` - cucumber tags  

# Reporting
Requiring Allure (installation details: [Allure installation](https://docs.qameta.io/allure/#_installing_a_commandline))  
For reporting is used Allure with logs and screenshots (for UI tests) attachments.  
After you tests executed all necessary for reporting folders will be created.  
To open generate allure and open in browser execute:  
```cmd
allure open path/to/project/allure-report
```
#### Note: if you have infinity loading browser screen just change your IP address in browser section to 'localhost'
#### Example : from 192.168.0.0:50000 to localhost:50000 

# Changelog
- 24.05.2020 - Framework commentating
- 23.05.2020 :
1) Readme changes
2) Chrome driver version update
3) Added support for Mac OS
- 21.05.2020 - Readme changes
- 15.05.2020 - First commit 

# TODO
- Implement testRail tests creation
- Implement testRail tests execution results parsing
- Implement other browsers for Selenium
