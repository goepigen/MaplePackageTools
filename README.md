## Maple Package Tools

Working with your own maple packages can seem a bit daunting at first.

Here are some tools to automate some tasks.

The Maple initialization file is assumed to exist at _/Library/Frameworks/Maple.framework/Versions/2022/lib/init_ (this is the location on a Mac).

### addPathToLibname(path)

Overwrites the current Maple initialization file with a command that sets _libname_ to the previous sequence of strings in _libname_ prepended with _path_.

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

### Using This Package For The First Time

To use this repository for the first time, in a Maple worksheet, add the directory of the repository to libname using the command

`libname := pathToRepoDir, libname;`

At this point you can use the commands from the `MaplePackageTools` package in the current worksheet.

To make this package available aways,

`MaplePackageTools:-addPathToLibname(pathToRepoDir);`

The repository directory is now added to _libname_ in the Maple initialization file.

### Limitations

This package was developed relatively quickly and did not try to avoid edge cases.

For example, every time you call _addPathToLibname_ you need to execute a _restart_ in a worksheet before you call it again. Otherwise, the change to _init_ from the first call will be overwritten by the change in the second call. The reason is that the second call will prepend _libname_, but _libname_ will still be the version before the first call.
