@ECHO off

ECHO WINDOWSͼƬ�鿴����ΪĬ�Ͽ�ͼ���
REG ADD "HKCR\.bmp" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.gif" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.ico" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.jpeg" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.jpg" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.png" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.tiff" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f

ECHO �����ļ�����ʱ�İ�ȫ����
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "DefaultFileTypeRisk" /t REG_DWORD /d 1808 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d 1 /f

ECHO �����Զ��������صĵ�ͼ
reg add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t "REG_DWORD" /d 0 /f

ECHO ������ʾ�ҵĵ��ԡ����硢�û�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {F02C1A0D-BE21-4350-88B0-7367FC96EF3C} /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {F02C1A0D-BE21-4350-88B0-7367FC96EF3C} /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /ve /t REG_SZ /d �ҵĵ��� /f
echo ���

ECHO ��Դ��������Ϊ�ҵĵ���
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /d 1 /t REG_DWORD /f
echo ���

ECHO ���ü��±�
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Notepad" /v fwrap /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Notepad" /v StatusBar /d 1 /t REG_DWORD /f
echo ���

ECHO �ر�Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
echo ���

ECHO ���Ҽ������Ĳ˵���ɾ����ʹ��Windows Defenderɨ�衱������WD������ʱ��Ч��
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\EPP" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\EPP" /f > NUL 2>&1

ECHO ���ö������ɾ�����ߵ�Windows����
reg add "HKLM\Software\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f

ECHO �ر�Windows����ǽ
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
sc stop MpsSvc MpsSvc & sc config MpsSvc start=disabled
echo ���

ECHO ������������ǩ��
reg add "HKLM\Software\Microsoft\Driver Signing" /v "Policy" /t REG_BINARY /d "01" /f

ECHO �ر��û��˻�����(UAC)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /d 0 /t REG_DWORD /f
echo ���

ECHO �ر�SmartscreenӦ��ɸѡ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d off /t REG_SZ /f
echo ���

ECHO �ػ�ʱǿ��ɱ��̨���ȴ�
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 0 /t REG_SZ /f
echo ���

ECHO ���÷���ǽWindows Firewall���񣨲������÷���ǽ��
sc config MpsSvc start= auto 
net start MpsSvc
echo ���

ECHO �ر�Զ��Э��
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /d 0 /t REG_dword /f
echo ���

ECHO ����Ҽ�����˵�
regsvr32 /u /s igfxpph.dll
reg delete HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers /f
reg add HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\new /ve /d {D969A300-E7FF-11d0-A93B-00A0C90F2719}
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v HotKeysCmds /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IgfxTray /f
echo ���

ECHO ȥ����ݷ�ʽ��׺
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
echo ���

ECHO ��ֹһ�����ʹ������
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /d 1 /t REG_DWORD /f
echo ���

ECHO ȥ��UACС����
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
echo ���

ECHO ж��OneDrive
taskkill /f /im OneDrive.exe   
taskkill /f /im explorer.exe    
if exist %SYSTEMROOT%\SysWOW64\OneDriveSetup.exe (    
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall    
) else (    //�������
%SYSTEMROOT%\System32\OneDriveSetup.exe /uninstall    
)
rd  /s /q "%USERPROFILE%\OneDrive"    
rd  /s /q "%LOCALAPPDATA%\Microsoft\OneDrive"   
rd  /s /q "%PROGRAMDATA%\Microsoft OneDrive"    
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f    
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f   
start explorer
echo ���
