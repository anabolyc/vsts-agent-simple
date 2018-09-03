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
    vcredist2013 \
    --confirm \
    --timeout 3600 \
    && rmdir /S /Q C:\chococache
    
RUN choco install \
    vcredist2017 \
    --confirm \
    --timeout 3600 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    netfx-4.5.1-devpack \
    --confirm \
    --verbose \
    --timeout 3600 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    netfx-4.5.2-devpack \
    --confirm \
    --verbose \
    --timeout 7200 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    dotnet4.6-targetpack \
    --confirm \
    --timeout 3600 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    dotnet4.6.1 \
    --confirm \
    --limit-output \
    && rmdir /S /Q C:\chococache

RUN choco install \
    netfx-4.6.1-devpack \
    --confirm \
    --timeout 3600 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    visualstudio2017enterprise \
    --package-parameters "--passive --locale en-US --includeOptional" \
    --confirm \
    --limit-output \
    --timeout 21600 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    visualstudio2017-workload-netweb \
#    visualstudio2017-workload-azure \
#    visualstudio2017-workload-netcoretools \
    --confirm \
    --limit-output \
#    --package-parameters "--includeOptional" \
    --package-parameters "--no-includeRecommended" \
    --timeout 21600 \
    && rmdir /S /Q C:\chococache

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
