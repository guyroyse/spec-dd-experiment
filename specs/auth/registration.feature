Feature: Registration
  Users need to create an account before they can use the application.
  Registration requires a username and password.

  Scenario: Successful registration
    Given the user is on the registration page
    When the user submits a username and password
    Then their account is created
    And they are logged in
    And they are taken to their todo list

  Scenario: Navigate to login from registration
    Given the user is on the registration page
    When the user chooses to log in instead
    Then they are taken to the login page

  Scenario Outline: Invalid characters are not allowed in username field
    Given the user is on the registration page
    When the user enters "<input>" as their username
    Then the username field shows "<result>"

    Examples:
      | input    | result |
      | " "      |        |
      | !        |        |
      | "alice " | alice  |
      | alice    | alice  |
      | alice!   | alice  |

  Scenario Outline: Username does not meet requirements
    Given the user is on the registration page
    When the user submits "<username>" as their username
    Then they are told the username does not meet requirements
    And they remain on the registration page

    Examples:
      | username                  | reason    |
      |                           | blank     |
      | ab                        | too short |
      | abcdefghijklmnopqrstuvwxy | too long  |

  Scenario: Username already taken
    Given the user is on the registration page
    And another user has already registered with the username "alice"
    When the user submits "alice" as their username
    Then they are told the username is not available
    And they remain on the registration page

  Scenario: Username already taken with different casing
    Given the user is on the registration page
    And another user has already registered with the username "Alice"
    When the user submits "ALICE" as their username
    Then they are told the username is not available
    And they remain on the registration page

  Scenario Outline: Password does not meet requirements
    Given the user is on the registration page
    When the user submits "<password>" as their password
    Then they are told the password does not meet requirements
    And they remain on the registration page

    Examples:
      | password     | reason                   |
      | Abc123!      | too short                |
      | ABCD123!@#   | missing lowercase letter |
      | abcd123!@#   | missing uppercase letter |
      | AbcdEfgh!@   | missing number           |
      | AbcdEfgh123  | missing symbol           |
      | Abc 1234!@   | contains space           |

  Scenario: Password confirmation does not match
    Given the user is on the registration page
    When the user submits a password and confirmation that do not match
    Then they are told the passwords do not match
    And they remain on the registration page

  Scenario: Already logged in
    Given the user is logged in
    When the user navigates to the registration page
    Then they are redirected to their todo list

