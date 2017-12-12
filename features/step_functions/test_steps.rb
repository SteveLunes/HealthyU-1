Given(/^I have not opened the application$/) do
  
end

value = 0
Given /the following users exist/ do |users_table|
   value = 0
  users_table.hashes.each do |user|
    User.create(user)
    value += 1
  end
end

val =0
Given /the following calories exist/ do |cal_table|
  val = 0
  cal_table.hashes.each do |cal|
    Nutrition.create(cal)
    val += 1
  end
end


Given /the following exercises exist/ do |ex_table|
   value = 0
  ex_table.hashes.each do |ex|
    Exercise.create(ex)
    value += 1
  end
end

Given /I am on the homepage/ do
  visit "/"
end

Given /I am on the users page/ do
  visit users_path
end

Given /I am on the show exercise page/ do
  visit exercise_path(1)
end

Given /I am on the show nutrition page/ do
  visit nutrition_path(1)
end

When("I click the exercise link") do
  click_link("Exercises")
end

When("I click the nutrition link") do
  click_link("Nutrition")
end

When("I click on the muscle link") do
  click_link("Chest")
end

When /^(?:|I )press "([^"]*)"$/ do |link|
  click_link(link)
end

And /^(?:|I )press the "([^"]*)" button$/ do |buttons|
  click_button(buttons)
end

And /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

Then /I should be on the homepage/ do
  visit root_path
end

Given(/^I am on the exercise page$/) do
  visit "/exercises"
end

Given(/^I am on the nutrition page$/) do
  visit "/nutritions"
end

Then /I should be on the exercises page/ do
  visit exercises_path
end

Then /I should be on the nutrition page/ do
  visit nutritions_path
end

Then /I should be on the users page/ do
  visit users_path
end

Then /I should be on the login page/ do
  visit login_path
end

Then /I should be on the signup page/ do
  visit signup_path
end

Then /I should be on the current users page/ do
  visit users_path(1)
end
  
Then("I should see the title {string}") do |string|
    page.should have_content(string)
end
  
# Then("I should see the title 'HealthyU'") do
#   page.should have_content("HealthyU")
# end

# Then /I should see the title "Exercises"/ do
#   page.should have_content("Exercises")
# end

Then /I should see "([^"]*)"$/ do |value|
  page.should have_content(value)
end

Then /I should see all the users/ do
  User.all.each do |user|
    step "I should see \"#{user.name}\""
  end
end

Then /I should see "([^"]*)" and "([^"]*)"$/ do |muscle, exercise|
  page.should have_content(muscle)
  page.should have_content(exercise)
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
