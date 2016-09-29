#!/bin/bash
# demo.t

test_description="starter Sharness tests"

. ./sharness.sh

test_expect_success 'failing test for string equality' '
    [ "Hello" = "HelloX" ]
'

test_expect_success 'passing test for string equality' '
    [ "Hello" = "Hello" ]
'

test_expect_failure 'broken test for string equality' '
    [ "Hello" = "HelloX" ]
'

test_expect_success 'verify expected test failure' '
    test_must_fail [ "Hello" = "HelloX" ]
'


test_done
