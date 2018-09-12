FROM andreymalyshenko/vsts-agent:ltsc2016-basic

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

# Nuget build tools
ADD [ "Nuget.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/Common7/IDE/CommonExtensions/Microsoft"]