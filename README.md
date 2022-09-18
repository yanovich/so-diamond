This small project demonstrates what happens when a function with the same name
behaves differently in different versions of a shared library.

It works with symbol versions.
```
$ make test
LD_LIBRARY_PATH=. ./main1
1
1
1
LD_LIBRARY_PATH=. ./main2
2
1
2
```
