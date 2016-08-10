#!/bin/bash
# -*- shell-script -*-
this_script=test-filecache.sh

# Test _Dbg_get_source_line
test_get_source_line()
{
    _Dbg_set_highlight=''
    _Dbg_source_line='no good'
    _Dbg_get_source_line 2 $this_script
    assertEquals '# -*- shell-script -*-' "$_Dbg_source_line"

    # Getting sourceline with highlight set but we don't have
    # the highlighted cached should fall back back to getting the line
    # without highlight.
    _Dbg_source_line='no good'
    _Dbg_set_highlight='light'
    _Dbg_get_source_line 2 $this_script
    assertEquals \
	"Requested highlight, it's not cached - fallback no highlight"\
	'# -*- shell-script -*-' "$_Dbg_source_line"
}

# Test readin and maxline
test_readin_maxline()
{
    typeset filename
    shu=$(_Dbg_resolve_expand_filename $shunit_file)
    _Dbg_readin ${shu}
    assertEquals "Read ${shu} status test" '0' $?
    typeset file2
    file2=$(_Dbg_is_file ${shu})
    assertEquals "Cached read of ${shu} test" '0' $?
    assertNotEquals "Getting cached file name back" '' "$file2"
    typeset -i maxline
    maxline=$(_Dbg_get_maxline $file2)
    assertEquals "Line-count of $file exit status" '0' $?
    # We'll assume shunit2 isn't going to get smaller ;-)
    assertEquals "Number of lines in $file2" 1 $(( maxline > 1000 ))
}

# Test check_line
# test should appear after tests which read in source.
test_check_line()
{
    _Dbg_errmsg() {
	errmsg+=("$1")
    }
    typeset -a errmsg; errmsg=()
    _Dbg_check_line
    assertNotEquals "check_line with wrong number of args" '0' $?
    _Dbg_check_line a
    assertNotEquals "check_line with wrong number of args" '0' $?
    _Dbg_check_line a b c
    assertNotEquals "check_line with wrong number of args" '0' $?
    _Dbg_readin "$shunit_file"
    _Dbg_check_line 10 $shunit_file
    assertEquals "check_line with an in_range number for $shunit_file" '0' $?
    assertEquals "error queue empty so far for $shunit_file" '0' ${#errmsg[@]}
    _Dbg_check_line 10000 $shunit_file
    assertNotEquals "check_line with wrong number of args" '0' $?
    assertEquals "error message generated" '1' ${#errmsg[@]}
    _Dbg_check_line 10000 $shunit_file
}

if [ '/src/external-vcs/sourceforge/bashdb' = '' ] ; then
  echo "Something is wrong abs_top_srcdir is not set."
 exit 1
fi

abs_top_srcdir=/src/external-vcs/sourceforge/bashdb
# Make sure $abs_top_srcrdir has a trailing slash
abs_top_srcdir=${abs_top_srcdir%%/}/
. ${abs_top_srcdir}test/unit/helper.sh
. ${abs_top_srcdir}init/pre.sh
. ${abs_top_srcdir}lib/filecache.sh
. ${abs_top_srcdir}lib/file.sh
. ${abs_top_srcdir}lib/msg.sh

set -- # reset $# so shunit2 doesn't get confused.

[[ $0 == ${BASH_SOURCE} ]] && . ${shunit_file}
