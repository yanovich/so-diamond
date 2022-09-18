all: libfoo.so.1.0.0 lib1/libfoo.so plugin.so main1 libfoo.so.2.0.0 lib2/libfoo.so main2

%.o: %.c
	gcc -c -fPIC -I. $< -o $@

libfoo.so.1.0.0: lib1/foo.o
	gcc -shared -fPIC -Wl,-soname,$@ -o $@ $< -lc

lib1/libfoo.so:
	ln -s ../libfoo.so.1.0.0 lib1/libfoo.so

main1: program1/main.o
	gcc -o $@ -L lib1 $< -lfoo

plugin.so: plug/plugin.o
	gcc -shared -fPIC -Wl,-soname,$@ -o $@ $< -L lib1 -lfoo

libfoo.so.2.0.0: lib2/foo.o
	gcc -shared -fPIC -Wl,-soname,$@ -o $@ $< -lc

lib2/libfoo.so:
	ln -s ../libfoo.so.2.0.0 lib2/libfoo.so

main2: program2/main.o
	gcc -o $@ -L lib2 $< -lfoo

clean:
	rm */*.o lib*.so.* plugin.so main1 main2

test: all
	LD_LIBRARY_PATH=. ./main1
	LD_LIBRARY_PATH=. ./main2
