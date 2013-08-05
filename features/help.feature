Feature: Get help about WP-CLI commands

  Scenario: Help for internal commands
    Given an empty directory

    When I run `wp help`
    Then STDOUT should not be empty

    When I run `wp help core`
    Then STDOUT should not be empty

    When I run `wp help core download`
    Then STDOUT should not be empty

    When I run `wp help help`
    Then STDOUT should not be empty

    When I try `wp help non-existent-command`
    Then the return code should be 1
    And STDERR should not be empty

  Scenario: Help for incomplete commands
    Given a WP install

    When I run `wp core`
    Then STDOUT should contain:
      """
      usage: wp core
      """

    # See https://github.com/wp-cli/wp-cli/issues/633
    When I run `wp plugin install`
    Then STDOUT should contain:
      """
      usage: wp plugin install
      """
