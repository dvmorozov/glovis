rem cd "d:\04 - my\projects\my\appsoft\smart grid\sgscada\SendVideoData\Sender"
copy /Y "StartExample.bat" "bin\Release"
7z.exe a -tzip -r sendvideodata.zip "Properties" *.cs *.csproj *.sln *.suo "bin\Release\senddata.exe" "bin\Release\DirectShowLib-2005.dll" "bin\Release\StartExample.bat"
move /Y sendvideodata.zip "..\..\web\Examples"
