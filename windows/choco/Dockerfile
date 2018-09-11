FROM microsoft/nanoserver:sac2016
ENV WINDOWS_IMAGE_VERSION=10.0.14393

RUN mkdir C:\temp \
    && mkdir C:\temp\choco-install \
    && cd C:\temp
WORKDIR C:/temp

ENV TEMP "C:/temp"
RUN @powershell -Command "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"

COPY ["install.ps1", "C:/temp"]
COPY ["chocolatey.0.10.11", "C:/temp/choco-install"]

RUN @powershell -File "install.ps1"
# && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

## TODO: uncomment below
# RUN choco config set cachelocation C:\chococache

# CLEAN C:/temp