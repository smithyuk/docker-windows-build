FROM microsoft/windowsservercore
MAINTAINER smithyuk1@live.co.uk

RUN powershell -NoProfile -Command \
    "Invoke-Webrequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression"

RUN "C:\ProgramData\chocolatey\choco install -y visualstudio2017buildtools curl"

RUN "setx PATH "%PATH%;C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\MSBuild\15.0\Bin""

RUN "curl -k https://dist.nuget.org/win-x86-commandline/latest/nuget.exe > nuget.exe"

ENTRYPOINT ["cmd.exe"]
