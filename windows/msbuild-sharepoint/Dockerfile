FROM andreymalyshenko/vsts-agent:ltsc2016-msbuild

## SharePoint build tools
#ADD [ "msbuild-microsoft-15.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild"]
#ADD [ "ms.visualstudio.sharepoint.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/Microsoft/VisualStudio/v15.0/SharePointTools"]
#ADD [ "extensions-sharepoint.tar.gz",  "C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/Common7/IDE/Extensions/Microsoft"]

# netfx-4.5.2
# RUN choco install \
#     netfx-4.5.2-devpack \
#     --confirm \
#     --timeout 7200 \
#     && rmdir /S /Q C:\chococache
# alternatively 

ADD [ "NDP452-KB2901951-x86-x64-DevPack.exe", "." ]
RUN NDP452-KB2901951-x86-x64-DevPack.exe /Quiet /NoRestart /Log netfx-4.5.2-devpack.txt \
    && del "NDP452-KB2901951-x86-x64-DevPack.exe"

ADD [ "NDP461-DevPack-KB3105179-ENU.exe", "." ]
RUN NDP461-DevPack-KB3105179-ENU.exe /Quiet /NoRestart /Log netfx-4.6.1-devpack.txt \
    && del "NDP461-DevPack-KB3105179-ENU.exe"

RUN choco install \
    visualstudio2017enterprise \
    --package-parameters "--passive --locale en-US" \
    --confirm \
    --limit-output \
    --timeout 21600 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    vcredist2013 vcredist2017 KB2882822 \
    --confirm \
    --limit-output \
    --timeout 21600 \
    && rmdir /S /Q C:\chococache

RUN choco install \
    visualstudio2017-workload-office  \
    --confirm \
    --limit-output \
    --ignoredependencies \
    --timeout 21600 \
    && rmdir /S /Q C:\chococache
# alternatively

# WORKDIR "C:/Program Files (x86)/Microsoft Visual Studio/Installer"
# RUN vs_installer.exe modify --installPath 'C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools' --includeRecommended --norestart --quiet --add Microsoft.VisualStudio.Workload.OfficeBuildTools

# WORKDIR C:/BuildAgent