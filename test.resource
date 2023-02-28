*** Variables ***
${TEST_SETUP}    Setup
${TEST_1_SETUP}    Setup custom
${TEST_1_TEARDOWN}    Teardown custom
${TEST_TEARDOWN}    Teardown
*** Keywords ***
Testing
    Log To Console    this is a test

voici un test
    Log To Console    c'est un test
Setup
    Log To Console    setup
Setup custom
    Log To Console    setupcustom
Teardown custom
    Log To Console    teardown custom
Teardown
    Log To Console    teardown
test "${string}"
    Log To Console    ${string}
test number two "${string}"
    Log To Console    ${string}
test number three
    Log To Console    commentaires
dataset "${var}"
    Log To Console    ${var}