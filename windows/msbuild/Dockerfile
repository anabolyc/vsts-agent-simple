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

RUN choco install \
    microsoft-build-tools \
    --confirm \
    --timeout 3600 \
    && rmdir /S /Q C:\chococache

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]