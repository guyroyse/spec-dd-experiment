Feature: Edit Todo
  Users can edit the text, due date, and priority of existing todos.

  Scenario: Edit todo text
    Given the user has a todo "Buy milk"
    When the user changes the text to "Buy oat milk"
    Then the todo shows "Buy oat milk"

  Scenario: Edit todo due date
    Given the user has a todo "Submit report" with no due date
    When the user sets the due date to "2026-03-15"
    Then the todo shows due date "2026-03-15"

  Scenario: Remove todo due date
    Given the user has a todo "Submit report" with due date "2026-03-15"
    When the user removes the due date
    Then the todo shows no due date

  Scenario: Edit todo priority
    Given the user has a todo "Call mom" with priority "Medium"
    When the user changes the priority to "High"
    Then the todo shows priority "High"

  Scenario: Cannot save todo with empty text
    Given the user is editing a todo "Buy milk"
    When the user clears the text and tries to save
    Then the change is not saved
    And they are told text is required

