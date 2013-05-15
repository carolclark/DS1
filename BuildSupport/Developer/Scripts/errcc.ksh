#!/bin/ksh

#  errcc
#  Support
#
#  Created by Carol Clark on 5/10/13.
#  Copyright 2013 C & C Software, Inc. All rights reserved.
#  Confidential and Proprietary.

#pragma mark === Markers ===
# 1 errorMessage; 2 errorExit; 8 errcc

NAME='errcc -- error handling'
USAGE='
errorMessage	[errorCode [location [message]]]
#		errorCode:	numeric error code
#						if errorCode is defined in resultCodes.ksh, message includes text equivalent
#						if errorCode is not a number, it is ignored
#		location: 	source file and line ($0#$LINENO)
#		message:	string to be displayed; default "Error encountered"
#	construct and return message based on arguments provided
errorExit		[errorCode [location [message]]]
#	construct errorMessage and print to stderr; exit with nonzero value (errorCode if supplied)
#	NOTE: running this from Terminal exits the current shell process; quit and restart Terminal
Note: to avoid generating new errors, these methods do not provide direct feedback for invalid arguments
errcc			subcommand
#	--help				<no args>
#						print this information
'
HELP="NAME: ${NAME}\nUSAGE: ${USAGE}"

. resultCodes

#pragma mark 1 === errorMessage
function errorMessage {
	location=""
	errorInfo=""
	message=""
	sp1=""
	sp2=""
	if [[ $# = 0 ]] ; then
		message="An unknown error occurred."
	fi
	if [[ $# > 0 ]] ; then
		errorInfo="$(errorCodeText $1)"
	fi
	if [[ $# > 1 ]] ; then
		location="$2"
		if [[ -n ${errorInfo} ]] ; then
			sp2=" "
		fi
	fi
	if [[ $# > 2 ]] ; then
		message="$3"
		sp1=" "
	fi
	echo "$location$sp1$message$sp2$errorInfo"
	return 0
}

#pragma mark 2 === errorExit
function errorExit {
	echo $(errorMessage "$1" "$2" "$3" 1>&2)
	errorCode="$1"
	if [[ $((${errorCode})) = 0 ]] ; then
		errorCode=255
	fi
	exit $errorCode
}

#pragma mark 6 === errorCodeText
function errorCodeText {
	errorCode=$1
	if [[ $((${errorCode})) > 0 ]] ; then
		case "${errorCode}" in
			1 );	echo "[[Operation not permitted; EPERM#1]" ;;
			2 );	echo "[[No such file or directory; ENOENT#2]"	;;
			3 );	echo "[[No such process; ESRCH#3]"	;;
			4 );	echo "[[Interrupted system call; EINTR#4]"	;;
			5 );	echo "[[Input/output error; EIO#5]"	;;
			6 );	echo "[Device not configured; ENXIO#6]"	;;
			7 );	echo "[Argument list too long; E2BIG#7]"	;;
			8 );	echo "[Exec format error; ENOEXEC#8]"	;;
			9 );	echo "[Bad file descriptor; EBADF#9]"	;;
			10 );	echo "[No child processes; ECHILD#10]"	;;
			11 );	echo "[Resource deadlock avoided; EDEADLK#11]"	;;
			12 );	echo "[Cannot allocate memory; ENOMEM#12]"	;;
			13 );	echo "[Permission denied; EACCES#13]"	;;
			14 );	echo "[Bad address; EFAULT#14]"	;;
			15 );	echo "[Block device required; ENOTBLK#15]"	;;
			16 );	echo "[Device / Resource busy; EBUSY#16]"	;;
			17 );	echo "[File exists; EEXIST#17]"	;;
			18 );	echo "[Cross-device link; EXDEV#18]"	;;
			19 );	echo "[Operation not supported by device; ENODEV#19]"	;;
			20 );	echo "[Not a directory; ENOTDIR#20]"	;;
			21 );	echo "[Is a directory; EISDIR#21]"	;;
			22 );	echo "[Invalid argument; EINVAL#22]"	;;
			23 );	echo "[Too many open files in system; ENFILE#23]"	;;
			24 );	echo "[Too many open files; EMFILE#24]"	;;
			25 );	echo "[Inappropriate ioctl for device; ENOTTY#25]"	;;
			26 );	echo "[Text file busy; ETXTBSY#26]"	;;
			27 );	echo "[File too large; EFBIG#27]"	;;
			28 );	echo "[No space left on device; ENOSPC#28]"	;;
			29 );	echo "[Illegal seek; ESPIPE#29]"	;;
			30 );	echo "[Read-only file system; EROFS#30]"	;;
			31 );	echo "[Too many links; EMLINK#31]"	;;
			32 );	echo "[Broken pipe; EPIPE#32]"	;;
			33 );	echo "[math: Numerical argument out of domain; EDOM#33]"	;;
			34 );	echo "[math: Result too large; ERANGE#34]"	;;
			35 );	echo "[Resource temporarily unavailable; EAGAIN#35]"	;;
			36 );	echo "[Operation now in progress; EINPROGRESS#36]"	;;
			37 );	echo "[Operation already in progress; EALREADY#37]"	;;
			38 );	echo "[Socket operation on non-socket; ENOTSOCK#38]"	;;
			39 );	echo "[Destination address required; EDESTADDRREQ#39]"	;;
			40 );	echo "[Message too long; EMSGSIZE#40]"	;;
			41 );	echo "[Protocol wrong type for socket; EPROTOTYPE#41]"	;;
			42 );	echo "[Protocol not available; ENOPROTOOPT#42]"	;;
			43 );	echo "[Protocol not supported; EPROTONOSUPPORT#43]"	;;
			44 );	echo "[Socket type not supported; ESOCKTNOSUPPORT#44]"	;;
			45 );	echo "[Operation not supported; ENOTSUP#45]"	;;
			46 );	echo "[Protocol family not supported; EPFNOSUPPORT#46]"	;;
			47 );	echo "[Address family not supported by protocol family; EAFNOSUPPORT#47]"	;;
			48 );	echo "[Address already in use; EADDRINUSE#48]"	;;
			49 );	echo "[Can't assign requested address; EADDRNOTAVAIL#49]"	;;
			50 );	echo "[Network is down; ENETDOWN#50]"	;;
			51 );	echo "[Network is unreachable; ENETUNREACH#51]"	;;
			52 );	echo "[Network dropped connection on reset; ENETRESET#52]"	;;
			53 );	echo "[Software caused connection abort; ECONNABORTED#53]"	;;
			54 );	echo "[Connection reset by peer; ECONNRESET#54]"	;;
			55 );	echo "[No buffer space available; ENOBUFS#55]"	;;
			56 );	echo "[Socket is already connected; EISCONN#56]"	;;
			57 );	echo "[Socket is not connected; ENOTCONN#57]"	;;
			58 );	echo "[Can't send after socket shutdown; ESHUTDOWN#58]"	;;
			59 );	echo "[Too many references: can't splice; ETOOMANYREFS#59]"	;;
			60 );	echo "[Operation timed out; ETIMEDOUT#60]"	;;
			61 );	echo "[Connection refused; ECONNREFUSED#61]"	;;
			62 );	echo "[Too many levels of symbolic links; ELOOP#62]"	;;
			63 );	echo "[File name too long; ENAMETOOLONG#63]"	;;
			64 );	echo "[Host is down; EHOSTDOWN#64]"	;;
			65 );	echo "[No route to host; EHOSTUNREACH#65]"	;;
			66 );	echo "[Directory not empty; ENOTEMPTY#66]"	;;
			67 );	echo "[Too many processes; EPROCLIM#67]"	;;
			68 );	echo "[Too many users; EUSERS#68]"	;;
			69 );	echo "[Disc quota exceeded; EDQUOT#69]"	;;
			70 );	echo "[Stale NFS file handle; ESTALE#70]"	;;
			71 );	echo "[Too many levels of remote in path; EREMOTE#71]"	;;
			72 );	echo "[RPC struct is bad; EBADRPC#72]"	;;
			73 );	echo "[RPC version wrong; ERPCMISMATCH#73]"	;;
			74 );	echo "[RPC prog. not avail; EPROGUNAVAIL#74]"	;;
			75 );	echo "[Program version wrong; EPROGMISMATCH#75]"	;;
			76 );	echo "[Bad procedure for program; EPROCUNAVAIL#76]"	;;
			77 );	echo "[No locks available; ENOLCK#77]"	;;
			78 );	echo "[Function not implemented; ENOSYS#78]"	;;
			79 );	echo "[Inappropriate file type or format; EFTYPE#79]"	;;
			80 );	echo "[Authentication error; EAUTH#80]"	;;
			81 );	echo "[Need authenticator; ENEEDAUTH#81]"	;;
			82 );	echo "[Device power is off; EPWROFF#82]"	;;
			83 );	echo "[Device error, e.g. paper out; EDEVERR#83]"	;;
			84 );	echo "[Value too large to be stored in data type; EOVERFLOW#84]"	;;
			85 );	echo "[program loading: Bad executable; EBADEXEC#85]"	;;
			86 );	echo "[program loading: Bad CPU type in executable; EBADARCH#86]"	;;
			87 );	echo "[program loading: Shared library version mismatch; ESHLIBVERS#87]"	;;
			88 );	echo "[program loading: Malformed Macho file; EBADMACHO#88]"	;;
			89 );	echo "[Operation canceled; ECANCELED#89]"	;;
			90 );	echo "[Identifier removed; EIDRM#90]"	;;
			91 );	echo "[No message of desired type; ENOMSG#91]"	;;
			92 );	echo "[Illegal byte sequence; EILSEQ#92]"	;;
			93 );	echo "[Attribute not found; ENOATTR#93]"	;;
			94 );	echo "[Bad message; EBADMSG#94]"	;;
			95 );	echo "[Reserved; EMULTIHOP#95]"	;;
			96 );	echo "[No message available on STREAM; ENODATA#96]"	;;
			97 );	echo "[Reserved; ENOLINK#97]"	;;
			98 );	echo "[No STREAM resources; ENOSR#98]"	;;
			99 );	echo "[Not a STREAM; ENOSTR#99]"	;;
			100 );	echo "[Protocol error; EPROTO#100]"	;;
			101 );	echo "[STREAM ioctl timeout; ETIME#101]"	;;
			102 );	echo "[Operation not supported on socket; EOPNOTSUPP#102]"	;;
			103 );	echo "[No such policy registered; ENOPOLICY#103]"	;;
			104 );	echo "[State not recoverable; ENOTRECOVERABLE#104]"	;;
			105 );	echo "[Previous owner died; EOWNERDEAD#105]"	;;
			106 );	echo "[Interface output queue is full; EQFULL#106]"	;;
			$RC_SyntaxError );	echo "[RC_SyntaxError:#$RC_SyntaxError]"	;;
			$RC_MissingArgument );	echo "[RC_MissingArgument:#$RC_MissingArgument]"	;;
			$RC_InvalidArgument );	echo "[RC_InvalidArgument:#$RC_InvalidArgument]"	;;
			$RC_InvalidInput );	echo "[RC_InvalidInput:#$RC_InvalidInput]"	;;
			$RC_InputNotHandled );	echo "[RC_InputNotHandled:#$RC_InputNotHandled]"	;;
			$RC_NoSuchDirectory );	echo "[RC_NoSuchDirectory:#$RC_NoSuchDirectory]"	;;
			* );	echo "[UnknownErrorCode:#$errorCode]"	;;
		esac
	else
		echo ""
	fi
}

#pragma mark 8 === errcc
function errcc {
	if [[ $# = 0 ]] ; then
		print "$0: missing commandFlag"
		return $RC_MissingArgument
	fi
	case "${1}" in
		"--help" )
			echo "${HELP}"
			;;
		"--"* )
			print "invalid subcommand $1"
			return $RC_InvalidArgument
			;;
		* )
			echo "${HELP}"
			;;
	esac
	return 0
}
