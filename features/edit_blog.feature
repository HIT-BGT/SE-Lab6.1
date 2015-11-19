Feature: Edit blog
  As a blog owner
  I can edit my blog posts
  Scenario: Edit blog
    Given there is a post with title "Dummy post" and content "Dummy content"
    And I am on the blog homepage
    When I edit this post
    And I update title to "Updated title" and content to "Updated content"
    Then I can see it has been updated