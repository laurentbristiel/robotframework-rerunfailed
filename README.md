# robotframework-rerunfailed
Robot Framework re-execution of failed test cases example

Usage: 
```
./launch_test_and_rerun.sh test-example.robot
```
will run our unstable test, and if it fails, it will run it again.
Then it will merge the 2 executions in a single output/log/report set of files.

For example:

```
    $ ./launch_test_and_rerun.sh unstable_suite.robot
    
    #######################################
    # Running portfolio a first time      #
    #######################################
    
    ==============================================================================
    Unstable Suite
    ==============================================================================
    unstable_test                                                         | FAIL |
    'False' should be true.
    ------------------------------------------------------------------------------
    Unstable Suite                                                        | FAIL |
    1 critical test, 0 passed, 1 failed
    1 test total, 0 passed, 1 failed
    ==============================================================================
    Output:  /Users/laurent/Development/github/robotframework-rerunfailed/output/output.xml
    Log:     /Users/laurent/Development/github/robotframework-rerunfailed/output/log.html
    Report:  /Users/laurent/Development/github/robotframework-rerunfailed/output/report.html
    
    #######################################
    # Running again the tests that failed #
    #######################################
    
    ==============================================================================
    Unstable Suite
    ==============================================================================
    unstable_test                                                         | PASS |
    ------------------------------------------------------------------------------
    Unstable Suite                                                        | PASS |
    1 critical test, 1 passed, 0 failed
    1 test total, 1 passed, 0 failed
    ==============================================================================
    Output:  /Users/laurent/Development/github/robotframework-rerunfailed/output/rerun.xml
    Log:     /Users/laurent/Development/github/robotframework-rerunfailed/output/log.html
    Report:  /Users/laurent/Development/github/robotframework-rerunfailed/output/report.html
    
    ########################
    # Merging output files #
    ########################
    
    Output:  /Users/laurent/Development/github/robotframework-rerunfailed/output/output.xml
    Log:     /Users/laurent/Development/github/robotframework-rerunfailed/output/log.html
    Report:  /Users/laurent/Development/github/robotframework-rerunfailed/output/report.html
```