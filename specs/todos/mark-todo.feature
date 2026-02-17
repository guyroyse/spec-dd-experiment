Feature: Mark Todo
  Users can mark todos as done or not done.

  Scenario: Mark a todo as done
    Given the user has a todo "Buy milk" that is not done
    When the user marks "Buy milk" as done
    Then the todo "Buy milk" is shown as done

  Scenario: Mark a done todo as not done
    Given the user has a todo "Buy milk" that is done
    When the user marks "Buy milk" as not done
    Then the todo "Buy milk" is shown as not done

