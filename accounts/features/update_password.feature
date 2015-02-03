@login_pass_user
@logout
Feature: Update Password

    Scenario Outline: User submits data to the update password form
        Given I am "a logged in user"
        When I visit the update password page
        And I enter "<new pass>" into the "new password" field
        And I enter "<current pass>" into the "current password" field
        And I submit the form
        Then I see "<message>"

        Examples:
            |   new pass    |   current pass    |   message                                     |
            |   ""          |   pass            |   This field is required.                     |
            |   newpass     |   ""              |   This field is required.                     |
            |   newpass     |   wrongpass       |   Incorrect password. Please try again.       |
            |   newpass     |   pass            |   Your example.com password has been updated. |

