Feature: Activate Account

    Scenario: Invited user visits page to activate account
        Given I am "an invited, but not activated user"
        When I visit my activation page "7891011"
        Then I see the activate account form, prepopulated with my data

    Scenario Outline: Invited user submits invalid data to the activate account form
        Given I am "an invited, but not activated user"
        When I visit my activation page "7891011"
        And I enter "<first name>" into the "first name" field
        And I enter "<last name>" into the "last name" field
        And I enter "<new pass>" into the "password" field
        And I enter "<confirm pass>" into the "confirm password" field
        And I submit the form
        Then I see "<error>"

        Examples:
            |   first name  |   last name   |    new pass   |   confirm pass    |   error                                           |
            |   ""          |   Last        |    pass       |   pass            |   This field is required.                         |
            |   First       |   ""          |    pass       |   pass            |   This field is required.                         |
            |   First       |   Last        |    ""         |   pass            |   This field is required.                         |
            |   First       |   Last        |    pass       |   ""              |   This field is required.                         |
            |   First       |   Last        |    pass       |   notmatching     |   Your passwords do not match. Please try again.  |

    Scenario: Invited user activates their account
        Given I am "an invited, but not activated user"
        When I visit my activation page "7891011"
        And I activate my account
        Then I am redirected to my dashboard
        And I see a welcome modal

    Scenario: Active user revisits page to activate account
        Given I am "a logged out user"
        When I visit my activation page "123456"
        Then I see "We're sorry, this activation token has already been used."

