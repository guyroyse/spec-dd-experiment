Feature: View Todos
  Users can view their todos in different sort orders. Each sort field can be toggled
  between ascending and descending. Sorting is cumulative — clicking multiple sort
  fields creates a multi-level sort where the most recent click is primary.

  # Default Sort

  Scenario: Todos are sorted alphabetically by text by default (Alfa to Zulu)
    Given the user has the following todos:
      | text          |
      | Call mom      |
      | Buy groceries |
      | Walk the dog  |
    When the user is on their todo list
    Then the todos are displayed in order: "Buy groceries", "Call mom", "Walk the dog"

  # Sorting by Text

  Scenario: Sort todos by text (Alfa to Zulu by default)
    Given the user has the following todos:
      | text          |
      | Zulu task     |
      | Alfa task     |
      | Mike task     |
    When the user sorts by text
    Then the todos are displayed in order: "Alfa task", "Mike task", "Zulu task"

  Scenario: Toggle text sort to Zulu to Alfa
    Given the user has the following todos:
      | text          |
      | Zulu task     |
      | Alfa task     |
      | Mike task     |
    When the user sorts by text
    And the user toggles the sort direction
    Then the todos are displayed in order: "Zulu task", "Mike task", "Alfa task"

  # Sorting by Due Date

  Scenario: Sort todos by due date (soonest first by default)
    Given the user has the following todos:
      | text          | due_date   |
      | Later task    | 2026-03-15 |
      | Sooner task   | 2026-03-01 |
    When the user sorts by due date
    Then the todos are displayed in order: "Sooner task", "Later task"

  Scenario: Toggle due date sort to latest first
    Given the user has the following todos:
      | text          | due_date   |
      | Later task    | 2026-03-15 |
      | Sooner task   | 2026-03-01 |
    When the user sorts by due date
    And the user toggles the sort direction
    Then the todos are displayed in order: "Later task", "Sooner task"

  Scenario: Todos without due date are always last
    Given the user has the following todos:
      | text          | due_date   |
      | Later task    | 2026-03-15 |
      | No due date   |            |
      | Sooner task   | 2026-03-01 |
    When the user sorts by due date
    Then the todos are displayed in order: "Sooner task", "Later task", "No due date"

  Scenario: Todos without due date are last even when reversed
    Given the user has the following todos:
      | text          | due_date   |
      | Later task    | 2026-03-15 |
      | No due date   |            |
      | Sooner task   | 2026-03-01 |
    When the user sorts by due date
    And the user toggles the sort direction
    Then the todos are displayed in order: "Later task", "Sooner task", "No due date"

  # Sorting by Priority

  Scenario: Sort todos by priority (highest first by default)
    Given the user has the following todos:
      | text          | priority |
      | Low task      | Low      |
      | High task     | High     |
      | Medium task   | Medium   |
    When the user sorts by priority
    Then the todos are displayed in order: "High task", "Medium task", "Low task"

  Scenario: Toggle priority sort to lowest first
    Given the user has the following todos:
      | text          | priority |
      | Low task      | Low      |
      | High task     | High     |
      | Medium task   | Medium   |
    When the user sorts by priority
    And the user toggles the sort direction
    Then the todos are displayed in order: "Low task", "Medium task", "High task"

  # Multi-Level Sorting

  Scenario: Secondary sort applies when primary values are equal
    Given the user has the following todos:
      | text          | due_date   | priority |
      | High urgent   | 2026-03-01 | High     |
      | Low urgent    | 2026-03-01 | Low      |
      | High later    | 2026-03-15 | High     |
    When the user sorts by priority
    And the user sorts by due date
    Then the todos are displayed in order: "High urgent", "Low urgent", "High later"

  Scenario: Three-level sort
    Given the user has the following todos:
      | text          | due_date   | priority |
      | Task C        | 2026-03-01 | High     |
      | Task A        | 2026-03-01 | High     |
      | Task B        | 2026-03-01 | Low      |
      | Task D        | 2026-03-15 | High     |
    When the user sorts by text
    And the user sorts by priority
    And the user sorts by due date
    Then the todos are displayed in order: "Task A", "Task C", "Task B", "Task D"
