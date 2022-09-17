This small project demonstrates what happens when a function with the same name
behaves differently in different versions of a shared library.

In short, every caller will envoke the first loaded variant of the function.

This example includes a program and a plugin, which use the same shared library.
The first versions behave as expected, because both use the same object. The
program moves to the 2nd verions then (`program2`), but the plugin doesn't.
When the plugin is envoked from the 2nd version, it is forced to use the 2nd
version of the library.

```
$ make test
LD_LIBRARY_PATH=. ./main1
1
1
1
LD_LIBRARY_PATH=. ./main2
2
2
2
```
