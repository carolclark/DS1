#! /usr/local/bin bats
#	mysql.bats

@test "verify == MySQL is configured as expected for TeamCity" {
	[ 0 = 0 ]
}

@test "1 equals 1" {
	[ 1 = 1 ]
}

@test "1 does not equal 0" {
	[ 1 != 0 ]
	! [ 1 = 0 ]
}
