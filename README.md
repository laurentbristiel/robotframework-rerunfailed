# robotframework-rerunfailed
Robot Framework re-execution of failed test cases example.
The script and the test hosted here are used in a [blog article](http://laurent.bristiel.com/re-executing-failed-test-cases-and-merging-outputs-with-robot-framework/) that shows how to use --rerunfailed and --merge.

Usage: 
```
./launch_test_and_rerun.sh test-example.robot
```
will run our unstable suite that contains a stable test and an unstable one.
If the unstable fails, we will launch it again.
Then we will merge the 2 executions in a single output/log/report set of files.

For example:

```
    $ ./launch_test_and_rerun.sh unstable_suite.robot
    
    #######################################
    # Running portfolio a first time      #
    #######################################
    
    ==============================================================================
    Unstable Suite
    ==============================================================================
    stable_test                                                           | PASS |
    ------------------------------------------------------------------------------
    unstable_test                                                         | FAIL |
    'False' should be true.
    ------------------------------------------------------------------------------
    Unstable Suite                                                        | FAIL |
    2 critical tests, 1 passed, 1 failed
    2 tests total, 1 passed, 1 failed
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