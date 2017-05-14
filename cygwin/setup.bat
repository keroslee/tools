@echo off
set installFileName=cygwin-setup-x86_64.exe
set installDir=%~dp0
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

%installFileName% -qnNdO -R %installDir% -s http://cygwin.mirror.constant.com -l %installDir% ^
-P git -P wget -P curl -P chere

del download.vbs
del %installFileName%