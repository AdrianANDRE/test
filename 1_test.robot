*** Settings ***
Documentation    test
Metadata         ID                           1
Metadata         Automation priority          null
Metadata         Test case importance         Low
Resource         squash_resources.resource
Library          squash_tf.TFParamService
Test Setup       Test Setup
Test Teardown    Test Teardown


*** Test Cases ***
test
    [Documentation]    test

    &{dataset} =       Retrieve Dataset
    &{datatables} =    Retrieve Datatables
    &{docstrings} =    Retrieve Docstrings

    Given voici un test
    Given test "${datatables}[datatable_1]"
    Given test number two "${docstrings}[docstring_1]"
    Given test number three
    # bla bla
    Given dataset "${dataset}[var]"

*** Keywords ***
Test Setup
    [Documentation]    test setup
    ...                You can define the ${TEST_SETUP} variable with a keyword for setting up all your tests.
    ...                You can define the ${TEST_1_SETUP} variable with a keyword for setting up this specific test.
    ...                If both are defined, ${TEST_1_SETUP} will be run after ${TEST_SETUP}.

    ${TEST_SETUP_VALUE} =      Get Variable Value    ${TEST_SETUP}
    ${TEST_1_SETUP_VALUE} =    Get Variable Value    ${TEST_1_SETUP}
    IF    $TEST_SETUP_VALUE is not None
        Run Keyword    ${TEST_SETUP}
    END
    IF    $TEST_1_SETUP_VALUE is not None
        Run Keyword    ${TEST_1_SETUP}
    END

Test Teardown
    [Documentation]    test teardown
    ...                You can define the ${TEST_TEARDOWN} variable with a keyword for tearing down all your tests.
    ...                You can define the ${TEST_1_TEARDOWN} variable with a keyword for tearing down this specific test.
    ...                If both are defined, ${TEST_TEARDOWN} will be run after ${TEST_1_TEARDOWN}.

    ${TEST_1_TEARDOWN_VALUE} =    Get Variable Value    ${TEST_1_TEARDOWN}
    ${TEST_TEARDOWN_VALUE} =      Get Variable Value    ${TEST_TEARDOWN}
    IF    $TEST_1_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_1_TEARDOWN}
    END
    IF    $TEST_TEARDOWN_VALUE is not None
        Run Keyword    ${TEST_TEARDOWN}
    END

Retrieve Dataset
    [Documentation]    Retrieves Squash TM's datasets and stores them in a dictionary.
    ...
    ...                For instance, datasets containing 3 parameters "city", "country" and "currency"
    ...                have been defined in Squash TM.
    ...
    ...                First, this keyword retrieves parameter values from Squash TM
    ...                and stores them into variables, using the keyword 'Get Test Param':
    ...                ${city} =    Get Test Param    DS_city
    ...
    ...                Then, this keyword stores the parameters into the &{dataset} dictionary
    ...                with each parameter name as key, and each parameter value as value:
    ...                &{dataset} =    Create Dictionary    city=${city}    country=${country}    currency=${currency}

    ${var} =    Get Test Param    DS_var

    &{dataset} =    Create Dictionary    var=${var}

    RETURN    &{dataset}

Retrieve Datatables
    [Documentation]    Retrieves Squash TM's datatables and stores them in a dictionary.
    ...
    ...                For instance, 2 datatables have been defined in Squash TM,
    ...                the first one containing data:
    ...                | name | firstName |
    ...                | Bob  |   Smith   |
    ...                the second one containing data
    ...                | name  | firstName | age |
    ...                | Alice |   Smith   | 45  |
    ...
    ...                First, for each datatable, this keyword retrieves the values of each row
    ...                and stores them in a list, as follows:
    ...                @{row_1_1} =    Create List    name    firstName
    ...
    ...                Then, for each datatable, this keyword creates a list containing all the rows,
    ...                as lists themselves, as follows:
    ...                @{datatable_1} =    Create List    ${row_1_1}    ${row_1_2}
    ...
    ...                Finally, this keyword stores the datatables into the &{datatables} dictionary
    ...                with each datatable name as key, and each datatable list as value :
    ...                &{datatables} =    Create Dictionary    datatable_1=${datatable_1}    datatable_2=${datatable_2}

    @{row_1_1} =    Create List    produit     prix
    @{row_1_2} =    Create List    Expresso    0.40
    @{datatable_1} =    Create List    ${row_1_1}    ${row_1_2}

    &{datatables} =    Create Dictionary    datatable_1=${datatable_1}

    RETURN    &{datatables}

Retrieve Docstrings
    [Documentation]    Retrieves Squash TM's docstrings and stores them in a dictionary.
    ...
    ...                For instance, two docstrings have been defined in Squash TM,
    ...                the first one containing the string
    ...                "I am the
    ...                FIRST    docstring",
    ...                the second one containing the string "I am the second docstring"
    ...
    ...                First, this keyword retrieves values and converts them to an inline string :
    ...                ${docstring_1} =    Set Variable    I am the\nFIRST\tdocstring"
    ...
    ...                Then, this keyword stores the docstrings into the &{docstrings} dictionary
    ...                with each docstring name as key, and each docstring value as value :
    ...                ${docstrings} =    Create Dictionary    docstring_1=${docstring_1}    docstring_2=${docstring_2}

    ${docstring_1} =    Set Variable    zertyuioplkjhgfdqsxcvbh,fazertryhebzhehzbbhbsfghbdffffffffffffftttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee

    &{docstrings} =    Create Dictionary    docstring_1=${docstring_1}

    RETURN    &{docstrings}
