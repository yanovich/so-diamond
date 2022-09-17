all: libfoo.so.1.0.0 lib1/libfoo.so plugin.so main1

%.o: %.c
	gcc -c -fPIC -I. $< -o $@

libfoo.so.1.0.0: lib1/foo.o
	gcc -shared -fPIC -Wl,-soname,$@ -o $@ $< -lc

lib1/libfoo.so:
	ln -s ../libfoo.so.1.0.0 lib1/libfoo.so

main1: program1/main.o
	gcc -o $@ -L lib1 $< -lfoo

plugin.so: plug/plugin.o
	gcc -shared -fPIC -Wl,-soname,$@ -o $@ $< -lc

clean:
	rm lib1/*.o lib*.so.* plugin.so main1
