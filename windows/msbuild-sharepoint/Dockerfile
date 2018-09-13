FROM andreymalyshenko/vsts-agent:ltsc2016-msbuild

# SharePoint build tools
ADD [ "msbuild-microsoft-15.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild"]
ADD [ "ms.visualstudio.sharepoint.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/Microsoft/VisualStudio/v15.0/SharePointTools"]
ADD [ "extensions-sharepoint.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/Common7/IDE/Extensions/Microsoft"]

ADD service.bin.txt .
