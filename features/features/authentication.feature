Feature: Authentication

Scenario: Signing up
  Given I visit the homepage
  When I fill in the sign up form
  And I confirm the email
  Then should see that my account is confirmed

Scenario: User Logs In
  Given I am a registered user
  And I visit the homepage
  When I fill in the login form
  Then I should be logged in

Scenario: User Logs Out
  Given I am a registered user
  And I am logged in
  And I visit the homepage
  When I click on the log out button
  Then I should be redirected to the log in page
