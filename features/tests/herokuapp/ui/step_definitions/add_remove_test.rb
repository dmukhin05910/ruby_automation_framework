When(/^I am going to Add\/Remove Elements page$/) do
  @add_remove_page = $main_page.open_add_remove_elements
  @add_remove_page_asserts = $herokuapp_asserts.add_remove_elements_asserts(@add_remove_page)
end

Then(/^The Add\/Remove Elements page title should have "([^"]*)"$/) do |title|
  @add_remove_page_asserts.verify_title(title)
end

And(/^The Add\/Remove Elements Header should have "([^"]*)"$/) do |header|
  @add_remove_page_asserts.verify_header(header)
end

And('I click Add element button {int} times') do |clicks_count|
  @add_remove_page.add_element(clicks_count)
end

Then('Elements count should be {int}') do |count|
  @add_remove_page_asserts.verify_delete_elements_count(count)
end

And('I click Remove element button {int} times') do |count|
  @add_remove_page.delete_element(count)
end