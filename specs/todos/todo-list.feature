Feature: Todo List
  The todo list is the main page of the application where users manage their todos.

  Scenario: Username is displayed
    Given the user is logged in as "alice"
    When the user is on their todo list
    Then the username "alice" is displayed

  Scenario: Not logged in
    Given the user is not logged in
    When the user navigates to the todo list
    Then they are redirected to the login page

  Scenario: Empty todo list
    Given the user is logged in
    And the user has no todos
    When the user is on their todo list
    Then they see a message indicating they have no todos

