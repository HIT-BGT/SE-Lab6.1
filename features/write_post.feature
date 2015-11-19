Feature: Write blog
  As a blog owner
  I can write new blog post
  Scenario: Write blog
    Given I am on the blog homepage
    When I click "New Post" link
    And I fill "My first blog" as Title
    And I fill "Test content" as content
    And I click "Post" button
    Then I should see the blog I just posted