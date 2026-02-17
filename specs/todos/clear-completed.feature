Feature: Clear Completed Todos
  Users can clear all completed todos at once, with confirmation.

  Scenario: Clear completed todos with confirmation
    Given the user has the following todos:
      | text          | done  |
      | Done task 1   | true  |
      | Not done task | false |
      | Done task 2   | true  |
    When the user chooses to clear completed todos
    Then they are asked to confirm
    When the user confirms
    Then "Done task 1" is removed from the list
    And "Done task 2" is removed from the list
    And "Not done task" remains in the list

  Scenario: Cancel clearing completed todos
    Given the user has a completed todo "Done task"
    When the user chooses to clear completed todos
    And they are asked to confirm
    When the user cancels
    Then "Done task" remains in the list

  Scenario: No completed todos to clear
    Given the user has no completed todos
    When the user is on their todo list
    Then the clear completed option is not available

