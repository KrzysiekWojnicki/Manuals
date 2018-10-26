t=touch

otherfiles = myfile myotherfile
buildfiles = myfile2
all: myfile2
	
myfile:
	$(t)  $@

myotherfile:
	$(t)  $@

myfile2: $(otherfiles)
	cat  $^ > myfile2
clean:
	$(RM) $(otherfiles)
	$(RM) $(buildfiles)
// CC=gcc $(CC) - makro dla kompilatora C
// CFLAGS=-I. - CFLAGS is the list of flags to pass to the compilation command

