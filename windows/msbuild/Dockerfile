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

# RUN choco install \
#     visualstudio2017enterprise \
#     --package-parameters "--passive --locale en-US" \
#     --confirm \
#     --limit-output \
#     --timeout 21600 \
#     && rmdir /S /Q C:\chococache

ADD [ "msbuild-microsoft.tar.gz",  "C:/Program Files (x86)/MSBuild/"]
ADD [ "MSBuild.exe.config",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/15.0/Bin/"]
ADD [ "Nuget.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/Common7/IDE/CommonExtensions"]

ADD [ "v4.5.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]
ADD [ "v4.5.1.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]
ADD [ "v4.5.2.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]
ADD [ "v4.6.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]
ADD [ "v4.6.1.tar.gz",  "C:/Program Files (x86)/Reference Assemblies/Microsoft/Framework/.NETFramework"]

#SHELL ["C:/Program Files (x86)/Microsoft Visual Studio/Installer/vs_installer.exe", "modify", "--installPath", "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools", "--quiet", "--add", "Microsoft.VisualStudio.Component.NuGet.BuildTools", "--norestart", "--force"]

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]