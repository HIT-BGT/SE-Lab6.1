When /^I click "New Post" link$/ do
  click_on "New Post"
end

When /^I fill "(.*?)" as Title$/ do |title|
  @title = title
  fill_in "Title", :with => title
end

When /^I fill "(.*?)" as content$/ do |content|
  fill_in "Content", :with => content
end

When /^I click "(.*?)" button$/ do |btn|
  click_button btn
end

Then /^I should see the blog I just posted$/ do
  page.should have_content(@title)
end
