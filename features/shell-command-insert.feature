Feature: Insert content on several lines from shell command

  Scenario: Insert output from shell command
    Given I switch to buffer "list-of-things"
    Given I clear the buffer
    Given the following text in buffer:
    """
    fruit
    fruit
    fruit
    fruit
    fruit
    fruit
    """
    When I go to beginning of buffer
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-insert-shell-command-result"
    And I press "RET"
    And I type "seq 1 10|xargs -I {} echo {}'.'"
    And I execute the action chain
    Then I should see in buffer
    """
    1.fruit
    2.fruit
    3.fruit
    4.fruit
    5.fruit
    6.fruit
    """

  Scenario: Insert output from shell command with output smaller than actual number of lines
    Given I switch to buffer "list-of-things"
    Given I clear the buffer
    Given the following text in buffer:
    """
    fruit
    fruit
    fruit
    fruit
    fruit
    fruit
    """
    When I go to beginning of buffer
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-insert-shell-command-result"
    And I press "RET"
    And I type "seq 1 3|xargs -I {} echo {}'.'"
    And I execute the action chain
    Then I should see in buffer
    """
    1.fruit
    2.fruit
    3.fruit
    fruit
    fruit
    fruit
    """

  Scenario: Insert output from shell command output greater
    than actual number of lines
    Given I switch to buffer "list-of-things"
    Given I clear the buffer
    Given the following text in buffer:
    """
    fruit
    fruit
    """
    When I go to beginning of buffer
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-insert-shell-command-result"
    And I press "RET"
    And I type "seq 1 10|xargs -I {} echo {}'.'"
    And I execute the action chain
    Then I should see in buffer
    """
    1.fruit
    2.fruit
    """

  Scenario: Insert output from shell command output where mark are defined
    Given I switch to buffer "list-of-things"
    Given I clear the buffer
    Given the following text in buffer:
    """
    498-1686 Maecenas St.Gabon
    Ap #252-3643 Odio Av. Cook Islands
    Ap #666-7930 Risus. Street Niue
    6998 Accumsan Avenue Zambia
    205-1886 Eu Rd. United States Minor Outlying Islands
    """
    When I place the cursor before "St.Gabon"
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-record"
    And I execute the action chain
    When I place the cursor before "Cook Islands"
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-record"
    And I execute the action chain
    When I place the cursor before "Niue"
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-record"
    And I execute the action chain
    When I place the cursor before "Zambia"
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-record"
    And I execute the action chain
    When I place the cursor before "United States Minor Outlying Islands"
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-record"
    And I execute the action chain
    Given I start an action chain
    And I press "M-x"
    And I press "anyins-insert-shell-command-result"
    And I press "RET"
    And I type "yes '| Country : '|head -n 10"
    And I execute the action chain
    Then I should see in buffer
    """
    498-1686 Maecenas | Country : St.Gabon
    Ap #252-3643 Odio Av. | Country : Cook Islands
    Ap #666-7930 Risus. Street | Country : Niue
    6998 Accumsan Avenue | Country : Zambia
    205-1886 Eu Rd. | Country : United States Minor Outlying Islands
    """

