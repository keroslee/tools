@echo off
set installFileName=setup-x86_64.exe
set installDir=%~dp0

cd %installDir%
curl https://cygwin.com/setup-x86_64.exe > %installFileName%
cd ..

%installDir%/%installFileName% -qnNdO -R %cd% -s http://cygwin.mirror.constant.com -l %cd% -P curl -P wget

echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%cd%\Cygwin64 Terminal.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%cd%\bin\mintty.exe" >> CreateShortcut.vbs
echo oLink.Arguments = " -i /Cygwin-Terminal.ico -" >> CreateShortcut.vbs
echo oLink.IconLocation ="%cd%\Cygwin-Terminal.ico" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
CreateShortcut.vbs
del CreateShortcut.vbs