# Bash programming

## Motivation

![](11th_grade_BASH.png)

## Hello world

```bash
$ cat > hello.sh

echo "Hallo Welt."

^D
```

You can check the contents of your file with `cat` or `more`. There are two ways you can "run" or execute this program. 

1. __Source__ the file. You can source the file with `source hello.sh` Try this you should see:
```bash
$ source hello.sh
Hallo Welt.
$
```

N.B. you might not see `$` but instead some other prompt. `source` is used so often that there is a shortcut for it the _dot_ operator (.):

```bash
$ . hello.sh
Hallo Welt.
$
```

2. Direct executation. You can change/edit this file to make it an executable script. There are two things you need to do in order to do so. 

	1. Edit the file and add the following line as the __first__ line of the file.
	
	```bash
	#!/bin/bash
	
	echo "Hallo Welt."
	```
	
	Save the file. 
	
	Now try to exectuate it (run it) by typing:
	```bash
	$ ./hello.sh
	```
	
	you should see:
	```bash
	$ ./hello.sh
	-bash: ./hello.sh: Permission denied
	```
	
	As a safety/security measure files when created or normally defaulted to be not-_executable_. You make a file executable using the `chmod` command. To do so type:
	```bash
	$ chmod u+x hello.sh
	```
	
	Now you can run the command directly by typing using `./hello.sh`
	```
	$ ./hello.sh
	Hallo Welt.
	$
	```

	What is the meaning of the `./` why do we need it here but not for `chmod` or any other UNIX command we type?
	
# Variables

## Setting vs Getting

Bash different from most other programming langues in that setting a variables has a different syntax from getting the value form a variable. In pretty much ever other language to set you do something like:

```
x = 1
x := 1
x <- 1
```

which will set the value of the variable `x` to 1. To _get_ the value of a variable you simple use its name:
```bash
y=x     # Set y to x
print x # Print the value of x
f(x)    # Call the function f with value x
```

However Bash is different (most shell languages follow this convention)

```bash
x = 1   # Set variable x to 1

y = $x  # Set variable y to value of x
echo $x # Print the value of x
f $x    # call function f with value of x
```

## Environment variables: PATH

	* which

## Add language variables

## IF

## Command line args

## For

## Sub Shells

ls

x=ls
echo $x

how do we get x to be set to the _value_ of `ls`

```bash
x=$(ls)
x=`ls`

echo $x
```

## Resources

* Google: `bash programming tutorials`

    * http://tldp.org/LDP/Bash-Beginners-Guide/html/

	* http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html
	* http://tldp.org/LDP/abs/html/

	* http://ryanstutorials.net/bash-scripting-tutorial/

## Plug for version control

* Learn and use it. Recomendation `git`

## Exercise:

Scan for the location of all programs listed in the file: 

	computationalGenomicsPrograms
	
