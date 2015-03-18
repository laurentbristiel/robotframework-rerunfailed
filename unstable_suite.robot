*** Settings ***
Library   String
Metadata  Log of First Run   [first_run_log.html|first_run_log.html]
Metadata  Log of Second Run  [second_run_log.html|second_run_log.html]

*** Test Cases ***
stable_test
    should be true  ${True}

unstable_test
    ${bool} =  random_boolean
    should be true  ${bool}
    
*** Keywords ***
random_boolean
    ${nb_string} =  generate random string  1  [NUMBERS]
    ${nb_int} =  convert to integer  ${nb_string}
    Run keyword and return  evaluate  (${nb_int} % 2) == 0    