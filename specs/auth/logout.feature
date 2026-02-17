Feature: Logout
  Users can end their session from the todo list page.

  Scenario: Successful logout
    Given the user is logged in
    And the user is on their todo list
    When the user logs out
    Then their session is ended
    And they are taken to the logged out page

