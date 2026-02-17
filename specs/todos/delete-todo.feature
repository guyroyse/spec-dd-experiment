Feature: Delete Todo
  Users can delete individual todos from their list.

  Scenario: Delete a todo
    Given the user has a todo "Buy milk"
    When the user deletes "Buy milk"
    Then "Buy milk" is removed from the list

