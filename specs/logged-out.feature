Feature: Logged Out Page
  After logging out, users see a confirmation page with options to log back in or register a new account.

  Scenario: Navigate to login from logged out page
    Given the user is not logged in
    And the user is on the logged out page
    When the user chooses to log in
    Then they are taken to the login page

  Scenario: Navigate to registration from logged out page
    Given the user is not logged in
    And the user is on the logged out page
    When the user chooses to register
    Then they are taken to the registration page

  Scenario: Already logged in
    Given the user is logged in
    When the user navigates to the logged out page
    Then they are redirected to their todo list

