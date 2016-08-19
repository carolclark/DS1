#!/bin/bash
# demo.t

# Created using AppCode by carolclark on 2016-08-17 for project Support.
# Copyright (c) 2016 by C & C Software, Inc.

test_description="starter Sharness tests"

. ${HOME}/Library/CCDev/bin/Sharness/sharness.sh

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
