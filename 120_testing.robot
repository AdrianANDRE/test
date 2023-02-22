# Automation priority: null
# Test case importance: Low
*** Settings ***
Resource	squash_resources.resource

*** Keywords ***
Test Setup
	${__TEST_SETUP}	Get Variable Value	${TEST SETUP}
	${__TEST_120_SETUP}	Get Variable Value	${TEST 120 SETUP}
	Run Keyword If	$__TEST_SETUP is not None	${__TEST_SETUP}
	Run Keyword If	$__TEST_120_SETUP is not None	${__TEST_120_SETUP}

Test Teardown
	${__TEST_120_TEARDOWN}	Get Variable Value	${TEST 120 TEARDOWN}
	${__TEST_TEARDOWN}	Get Variable Value	${TEST TEARDOWN}
	Run Keyword If	$__TEST_120_TEARDOWN is not None	${__TEST_120_TEARDOWN}
	Run Keyword If	$__TEST_TEARDOWN is not None	${__TEST_TEARDOWN}

*** Test Cases ***
testing
	[Setup]	Test Setup

	Given Testing

	[Teardown]	Test Teardown