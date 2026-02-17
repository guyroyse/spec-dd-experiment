Feature: Add Todo
  Users can add new todos to their list.

  Scenario: Add a todo with just text
    Given the user is on their todo list
    When the user adds a todo with the text "Buy groceries"
    Then the todo "Buy groceries" appears in the list
    And the todo has priority "Medium"
    And the todo has no due date
    And the todo is not done

  Scenario: Add a todo with text and priority
    Given the user is on their todo list
    When the user adds a todo with the text "Call mom" and priority "High"
    Then the todo "Call mom" appears in the list
    And the todo has priority "High"
    And the todo has no due date
    And the todo is not done

  Scenario: Add a todo with text and due date
    Given the user is on their todo list
    When the user adds a todo with the text "Submit report" and due date "2026-03-01"
    Then the todo "Submit report" appears in the list
    And the todo has priority "Medium"
    And the todo has due date "2026-03-01"
    And the todo is not done

  Scenario: Add a todo with all fields filled out
    Given the user is on their todo list
    When the user adds a todo with the text "Submit report", priority "High", and due date "2026-03-01"
    Then the todo "Submit report" appears in the list
    And the todo has priority "High"
    And the todo has due date "2026-03-01"
    And the todo is not done

  Scenario: Cannot add a todo without text
    Given the user is on their todo list
    When the user tries to add a todo with no text
    Then the todo is not added
    And they are told text is required

