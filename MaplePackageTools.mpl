MaplePackageTools := module()
    option package;

    local mapleInitFile, defaultLibDir, createInitString, updateLibname;

    mapleInitFile := "/Library/Frameworks/Maple.framework/Versions/2022/lib/init":

    export removeEntryFromLibname := proc(index)
        local libn, newlibnameArr, newLibnameStr:
        libn := libname;
        newlibnameArr := subsop(index=NULL, [libn]):
        newLibnameStr := createInitString(newlibnameArr):
        updateLibname(newLibnameStr):
    end;

    export addPathToLibname := proc(path)
        local newLibnameStr, newLibnameArr:
        newLibnameArr := [path, libname]:
        newLibnameStr := createInitString(newLibnameArr):
        updateLibname(newLibnameStr):
    end:

    createInitString := proc(libnameArr)
         cat("libname", ":= \"", seq(ListTools:-Join(libnameArr, "\", \"")), "\":")
    end;

    updateLibname := proc(newLibname)
        try 
            FileTools:-Text:-Open(mapleInitFile, 'overwrite'):
        catch:
            return "Failed to open file":
        end:

        try
            FileTools:-Text:-WriteLine(mapleInitFile, newLibname):
        catch:
            FileTools:-Text:-Close(mapleInitFile):  
            return "Failed to write to file.": 
        end: 

        try
            FileTools:-Text:-Close(mapleInitFile):   
            return "Added to libname successfully. Restart worksheet for changes to come into effect.":
        catch: 
            return "Failed to close file":
        end:
    end:

    export savePackageToMla := proc(mlaPath, mplPath, packageName)

        read(mplPath);

        LibraryTools:-Save(packageName, mlaPath);

    end:

end: