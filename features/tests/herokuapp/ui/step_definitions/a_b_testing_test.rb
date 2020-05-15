When(/^I am going to A\/B Testing page$/) do
  @ab_page = $main_page.open_a_b_page
  @ab_page_asserts = $herokuapp_asserts.a_b_testing_asserts(@ab_page)
end

Then(/^The A\/B testing page title should have "([^"]*)"$/) do |title|
  @ab_page_asserts.verify_title(title)
end

And(/^Header should have "([^"]*)"$/) do |header|
  @ab_page_asserts.verify_header(header)
end