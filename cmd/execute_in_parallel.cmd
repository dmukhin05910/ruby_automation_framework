cd ../
bundle exec parallel_cucumber features/ -n 6 -o '-t  "@api_case or @ui_case" --format pretty --format AllureCucumber::CucumberFormatter --out report/allure-results'