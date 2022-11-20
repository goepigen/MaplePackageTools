## Maple Package Tools

Working with your own maple packages can seem a bit daunting at first.

Here are some tools to automate some tasks.

The Maple initialization file is assumed to exist at _/Library/Frameworks/Maple.framework/Versions/2022/lib/init_ (this is the location on a Mac).

### addPathToLibname(path)

Overwrites the current Maple initialization file with a string that is composed of the previous items in _libname_ prepended with _path_.

### savePackageToMla(mlaPath, mplPath, packageName)

Reads the file at _mplPath_. _packageName_ should be the name of a package defined in the file at _mplPath_. Then, uses _LibraryTools:Save_ to save this package to the _.mla_ file at _mlaPath_.

### removeEntryFromLibname(index)

_libname_ is a sequence of strings. This procedure removes the entry at the i-th index.

## Suggested Workflow

1. Create a new project directory (or clone a newly created Github repo, for example)

2. call _addPathToLibname(projectDirectory)_

3. create an \*.mpl$ file that defines a package

4. create an $.mla$ file to store the package

5. call \*savePackageToMla(mlaPath, mplPath, packageName)

6. use the package from any worksheet using _with_ or _use_

7. if package code is modified, call _savePackageToMla(mlaPath, mplPath, packageName)_ once again to update the _.mla_ file.

8. if you share your project directory with someone else (or if you clone a repo with an _.mla_ file), call _addPathToLibname(projectDirectory)_ to be able to use the packages in the _.mla_ file.
