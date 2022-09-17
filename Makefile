all: libfoo.so.1.0.0 lib1/libfoo.so main1

%.o: %.c
	gcc -c -fPIC -I. $< -o $@

libfoo.so.1.0.0: lib1/foo.o
	gcc -shared -fPIC -Wl,-soname,libfoo.so.1.0.0 -o libfoo.so.1.0.0 $< -lc

lib1/libfoo.so:
	ln -s ../libfoo.so.1.0.0 lib1/libfoo.so

main1: program1/main.o
	gcc -o $@ -L lib1 $< -lfoo

clean:
	rm lib1/*.o lib*.so.* main1
