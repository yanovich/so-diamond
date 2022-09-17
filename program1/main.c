#include <dlfcn.h>
#include "lib1/foo.h"

int main ()
{
	void *handle;
	void (*bar)();

	handle = dlopen("plugin.so", RTLD_LAZY);
	if (!handle) {
		return 2;
	}
	bar = (void (*)()) dlsym(handle, "bar");
	if (!bar) {
		return 2;
	}
	foo();
	(*bar)();
	dlclose(handle);
	foo();
	return 0;
}
