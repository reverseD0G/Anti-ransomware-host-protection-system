set DevPath="D:\Microsoft Visual Studio 9.0\Common7\IDE\devenv.exe"

echo "开始编译应用层所有项目（非工具）Release版..."

del /q ..\bin\Release\*.exe

@echo =====================================
@echo 正在编译RWTClean...
%DevPath% "RWTClean.sln" /Rebuild Release /Out log.txt


@echo =====================================
@echo 正在编译RWTKrlSvc...
%DevPath% "RWTKrlSvc.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo 正在编译GUIInterFace...
%DevPath% "GUIInterFace.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo 拷贝lib库到RWTKit目录下..
copy ..\bin\Release\*.lib .\RWTKit\*.* /y


@echo =====================================
@echo 正在编译RWTService...
%DevPath% "RWTService.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo 正在编译RWTWatcher...
%DevPath% "RWTWatcher.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo 正在编译RWTerminator...
%DevPath% "RWTerminator.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo 正在编译RWTUnInstall...
%DevPath% "RWTUnInstall.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo 拷贝文件到RWTerminatorSetup目录...
copy ..\bin\Release\*.exe .\RWTerminatorSetup\uires\SetupFile\*.* /y
copy ..\bin\Release\*.dll .\RWTerminatorSetup\uires\SetupFile\*.* /y
copy ..\bin\Release\*.dat .\RWTerminatorSetup\uires\SetupFile\*.* /y
copy ..\bin\Release\*.sys .\RWTerminatorSetup\uires\SetupFile\*.* /y

@echo =====================================
@echo 正在编译RWTerminatorSetup...
%DevPath% "RWTerminatorSetup.sln"  /Rebuild Release /Out log.txt

@echo =====================================
@echo 开始清除所有临时文件和文件夹...

del /q ..\bin\Release\*.exp
del /q ..\bin\Release\*.pdb
del /q ..\bin\Release\*.lib
del /q ..\bin\Release\Release\*.*
rd  /q ..\bin\Release\Release

echo "用层所有项目（非工具）Release版 全部编译完成......"