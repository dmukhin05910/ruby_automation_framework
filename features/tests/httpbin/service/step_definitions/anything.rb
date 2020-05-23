Given(/^I have actors with (.*) and (.*)$/) do |name, year|
  @actor_builder = Service::Models::Objects::Httpbin::Actor.builder
  @actor_builder.with_name(name)
      .with_year(year)
end

And(/^Each actor have (.*) and (.*)$/) do |role, numbers|
  @role_json = Service::Models::Objects::Httpbin::Role.builder
                   .with_role(role)
                   .with_numbers(numbers.split(','))
                   .build
  @actor = @actor_builder.with_actors(@role_json)
               .build
end

When(/^I send POST request to with created payload to \/anything path$/) do
  @post_response = $endpoints.httpbin_endpoint.post_anything(@actor.to_json)
end

Then(/^Responce should have all data from payload$/) do
  $httpbin_asserts.anything_asserts(@post_response.json).verify_actors(@actor)
end