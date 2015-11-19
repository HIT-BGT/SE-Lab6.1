Given(/^there is a post titled with "(.*?)" and content with "(.*?)"$/) do |title, content|
  Post.create!({ :title => title, :content => content, :post_time => Time.now })
  visit("/posts")
end

When(/^I select a post$/) do
  click_link 'Show'
end

And(/^I click "(.*?)"$/) do |delete_post|
  click_link delete_post
end

Then(/^the post should be deleted$/) do
  page.should have_css("table#posts-list tr", :count=>1)
end


