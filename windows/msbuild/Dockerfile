FROM andreymalyshenko/vsts-agent:ltsc2016

ENV chocolateyUseWindowsCompression=true
RUN @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

RUN choco config set cachelocation C:\chococache

RUN choco install \
    git  \
    nodejs \
    curl \
    --confirm \
    --limit-output \
    --timeout 21600 \
    && rmdir /S /Q C:\chococache

# common node tools
RUN npm install gulp -g && npm install grunt -g && npm install -g less && npm install phantomjs-prebuilt -g

# netfx-4.5.2
# RUN choco install \
#     netfx-4.5.2-devpack \
#     --confirm \
#     --timeout 7200 \
#     && rmdir /S /Q C:\chococache

RUN choco install \
    microsoft-build-tools \
    --confirm \
    --timeout 3600 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    msdeploy msdeploy3 webdeploy \
    --confirm \
    --timeout 3600 \
    && rmdir /S /Q C:\chococache

# # RUN choco install \
# #     visualstudio2017enterprise \
# #     --package-parameters "--passive --locale en-US" \
# #     --confirm \
# #     --limit-output \
# #     --timeout 21600 \
# #     && rmdir /S /Q C:\chococache

ADD [ "v4.5.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]
ADD [ "v4.5.1.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]
ADD [ "v4.5.2.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]
ADD [ "v4.6.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]
ADD [ "v4.6.1.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]

# ADD [ "msbuild-microsoft.tar.gz",  "C:/Program Files (x86)/MSBuild/"]
# SharePoint build tools
ADD [ "msbuild-microsoft-15.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild"]
ADD [ "ms.visualstudio.sharepoint.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/Microsoft/VisualStudio/v15.0/SharePointTools"]

# Nuget build tools
ADD [ "Nuget.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/Common7/IDE/CommonExtensions/Microsoft"]

RUN @powershell -Command "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"

# # RUN @powershell -Command "$dllpath = 'C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/Common7/IDE/PublicAssemblies'; \
# #     [System.Reflection.Assembly]::Load('System.EnterpriseServices, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a'); \
# #     Get-ChildItem $dllpath -Filter 'Microsoft.VisualStudio.SharePoint*.dll' | % { \
# #         Write-Host $_.FullName \
# #         (New-Object System.EnterpriseServices.Internal.Publish).GacInstall($($_.FullName)) \
# #     }" 

# RUN @powershell -Command "Copy-Item 'C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/Common7/IDE/PublicAssemblies/Microsoft.VisualStudio.SharePoint*.dll' 'C:/Program Files (x86)/MSBuild/Microsoft/VisualStudio/v14.0/SharePointTools'"



