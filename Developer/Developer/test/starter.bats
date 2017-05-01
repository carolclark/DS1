#! /usr/local/bin bats
#	starter.bats

@test "0 equals 0" {
	[ 0 = 0 ]
}

@test "1 equals 1" {
	[ 1 = 1 ]
}

@test "1 does not equal 0" {
	[ 1 != 0 ]
	! [ 1 = 0 ]
}
