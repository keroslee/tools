@echo off
set installFileName=setup-x86_64.exe
set installDir=%~dp0

cd %installDir%
curl https://cygwin.com/setup-x86_64.exe > %installFileName%

if exist "%installDir%%installFileName%" goto install

echo	' Set your settings								>	download.vbs
echo	    strFileURL = "https://cygwin.com/setup-x86_64.exe"				>>	download.vbs
echo	    strHDLocation = "%installFileName%"						>>	download.vbs

echo	' Fetch the file								>>	download.vbs
echo	    Set objXMLHTTP = CreateObject("MSXML2.XMLHTTP")				>>	download.vbs

echo	    objXMLHTTP.open "GET", strFileURL, false					>>	download.vbs
echo	    objXMLHTTP.send()								>>	download.vbs

echo	If objXMLHTTP.Status = 200 Then							>>	download.vbs
echo	Set objADOStream = CreateObject("ADODB.Stream")					>>	download.vbs
echo	objADOStream.Open								>>	download.vbs
echo	objADOStream.Type = 1 'adTypeBinary						>>	download.vbs

echo	objADOStream.Write objXMLHTTP.ResponseBody					>>	download.vbs
echo	objADOStream.Position = 0    'Set the stream position to the start		>>	download.vbs

echo	Set objFSO = Createobject("Scripting.FileSystemObject")				>>	download.vbs
echo	If objFSO.Fileexists(strHDLocation) Then objFSO.DeleteFile strHDLocation	>>	download.vbs
echo	Set objFSO = Nothing								>>	download.vbs

echo	objADOStream.SaveToFile strHDLocation						>>	download.vbs
echo	objADOStream.Close								>>	download.vbs
echo	Set objADOStream = Nothing							>>	download.vbs
echo	End if										>>	download.vbs

echo	Set objXMLHTTP = Nothing							>>	download.vbs

download.vbs

cd ..

:install
echo installing
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