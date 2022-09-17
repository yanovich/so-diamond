%.o: %.c
	gcc -c -fPIC $< -o $@

libfoo.so.1.0.0: foo.o
	gcc -shared -fPIC -Wl,-soname,libfoo.so.1 -o libfoo.so.1.0.0 foo.o -lc

clean:
	rm *.o libfoo*

all: libfoo.so.1.0.0
