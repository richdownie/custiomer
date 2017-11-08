Feature: Api cukes

Scenario: I should see 16 open issues accross all repositories
	Given There are "16" open issues accross all repositories

Scenario: I sort the repositories date updated in descending order
	Given I sort the repositories date updated in descending order

Scenario: I display the which repository has the most watchers
	Given I display the which repository has the most watchers