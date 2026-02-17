Feature: Login
  Registered users need to log in to access their todos.

  Scenario: Successful login
    Given the user has a registered account
    And the user is on the login page
    When the user submits their username and password
    Then they are logged in
    And they are taken to their todo list

  Scenario: Successful login with different casing
    Given a user registered with the username "Alice"
    And the user is on the login page
    When the user submits "alice" as their username with the correct password
    Then they are logged in
    And their display name is "Alice"

  Scenario: Invalid credentials
    Given the user is on the login page
    When the user submits an incorrect username or password
    Then they are told their credentials are invalid
    And they remain on the login page

  Scenario: Navigate to registration from login
    Given the user is on the login page
    When the user chooses to register instead
    Then they are taken to the registration page

  Scenario: Already logged in
    Given the user is logged in
    When the user navigates to the login page
    Then they are redirected to their todo list

  Scenario Outline: Invalid characters are not allowed in username field
    Given the user is on the login page
    When the user enters "<input>" as their username
    Then the username field shows "<result>"

    Examples:
      | input    | result |
      | " "      |        |
      | !        |        |
      | "alice " | alice  |
      | alice    | alice  |
      | alice!   | alice  |

