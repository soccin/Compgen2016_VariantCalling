# Some additional UNIX exercises

## Create a convience script to run PICARD

Skip if you are new to UNIX or programming

0a) Look at BASH script that wraps PICARD: `picard.local`

0b) modify JAVA JAR path from local directory to a global one off home

0c) Add optional argument to set size of JVM

* The following BASH facts might be useful:

	* Command line arguments are bound to the following variables
	`$1 == ARG1`
	`$2 == ARG2`
	...
	
	* There is an `if` `then` construct and to test equality
	
	```bash
	if [ $1 == "XXX" ]; then
		# Do something if $1 === XXX
	fi
	```
	
	*N.B.* it is very (**very**) fussy about spacing

	* The `shift` command will _shift_ arguments to the ''left'' so to speak, i.e., after shift
	`$1 == ARG2`
	`$2 == ARG3`
 	... 
	You can shift multiple args with `shift N` where `N` is the number of args to 
	shift
	
	* Or if you are an intermediate BASH programmer google `getopts bash`