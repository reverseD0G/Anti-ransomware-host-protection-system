set DevPath="D:\Microsoft Visual Studio 9.0\Common7\IDE\devenv.exe"

echo "��ʼ����Ӧ�ò�������Ŀ���ǹ��ߣ�Release��..."

del /q ..\bin\Release\*.exe

@echo =====================================
@echo ���ڱ���RWTClean...
%DevPath% "RWTClean.sln" /Rebuild Release /Out log.txt


@echo =====================================
@echo ���ڱ���RWTKrlSvc...
%DevPath% "RWTKrlSvc.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo ���ڱ���GUIInterFace...
%DevPath% "GUIInterFace.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo ����lib�⵽RWTKitĿ¼��..
copy ..\bin\Release\*.lib .\RWTKit\*.* /y


@echo =====================================
@echo ���ڱ���RWTService...
%DevPath% "RWTService.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo ���ڱ���RWTWatcher...
%DevPath% "RWTWatcher.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo ���ڱ���RWTerminator...
%DevPath% "RWTerminator.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo ���ڱ���RWTUnInstall...
%DevPath% "RWTUnInstall.sln"  /Rebuild Release /Out log.txt


@echo =====================================
@echo �����ļ���RWTerminatorSetupĿ¼...
copy ..\bin\Release\*.exe .\RWTerminatorSetup\uires\SetupFile\*.* /y
copy ..\bin\Release\*.dll .\RWTerminatorSetup\uires\SetupFile\*.* /y
copy ..\bin\Release\*.dat .\RWTerminatorSetup\uires\SetupFile\*.* /y
copy ..\bin\Release\*.sys .\RWTerminatorSetup\uires\SetupFile\*.* /y

@echo =====================================
@echo ���ڱ���RWTerminatorSetup...
%DevPath% "RWTerminatorSetup.sln"  /Rebuild Release /Out log.txt

@echo =====================================
@echo ��ʼ���������ʱ�ļ����ļ���...

del /q ..\bin\Release\*.exp
del /q ..\bin\Release\*.pdb
del /q ..\bin\Release\*.lib
del /q ..\bin\Release\Release\*.*
rd  /q ..\bin\Release\Release

echo "�ò�������Ŀ���ǹ��ߣ�Release�� ȫ���������......"