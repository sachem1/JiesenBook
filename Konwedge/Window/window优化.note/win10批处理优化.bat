@ECHO off

ECHO WINDOWS图片查看器设为默认看图软件
REG ADD "HKCR\.bmp" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.gif" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.ico" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.jpeg" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.jpg" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.png" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
REG ADD "HKCR\.tiff" /v "" /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f

ECHO 禁用文件下载时的安全警告
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Associations" /v "DefaultFileTypeRisk" /t REG_DWORD /d 1808 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v "SaveZoneInformation" /t REG_DWORD /d 1 /f

ECHO 禁用自动更新下载的地图
reg add "HKLM\Software\Policies\Microsoft\Windows\Maps" /v "AutoDownloadAndUpdateMapData" /t "REG_DWORD" /d 0 /f

ECHO 桌面显示我的电脑、网络、用户
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {59031a47-3f72-44a7-89c5-5595fe6b30ee} /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {F02C1A0D-BE21-4350-88B0-7367FC96EF3C} /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {F02C1A0D-BE21-4350-88B0-7367FC96EF3C} /d 0 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /ve /t REG_SZ /d 我的电脑 /f
echo 完成

ECHO 资源管理器打开为我的电脑
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /d 1 /t REG_DWORD /f
echo 完成

ECHO 设置记事本
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Notepad" /v fwrap /d 1 /t REG_DWORD /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Notepad" /v StatusBar /d 1 /t REG_DWORD /f
echo 完成

ECHO 关闭Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /d 1 /t REG_DWORD /f
echo 完成

ECHO 从右键上下文菜单中删除“使用Windows Defender扫描”（仅在WD被禁用时有效）
reg delete "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\EPP" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\shellex\ContextMenuHandlers\EPP" /f > NUL 2>&1
reg delete "HKEY_CLASSES_ROOT\Drive\shellex\ContextMenuHandlers\EPP" /f > NUL 2>&1

ECHO 禁用恶意软件删除工具的Windows更新
reg add "HKLM\Software\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f

ECHO 关闭Windows防火墙
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" /v "EnableFirewall" /d 0 /t REG_DWORD /f
sc stop MpsSvc MpsSvc & sc config MpsSvc start=disabled
echo 完成

ECHO 禁用驱动程序签名
reg add "HKLM\Software\Microsoft\Driver Signing" /v "Policy" /t REG_BINARY /d "01" /f

ECHO 关闭用户账户控制(UAC)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "ConsentPromptBehaviorAdmin" /d 0 /t REG_DWORD /f
echo 完成

ECHO 关闭Smartscreen应用筛选器
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /d off /t REG_SZ /f
echo 完成

ECHO 关机时强制杀后台不等待
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "WaitToKillServiceTimeout" /d 0 /t REG_SZ /f
echo 完成

ECHO 启用防火墙Windows Firewall服务（并非启用防火墙）
sc config MpsSvc start= auto 
net start MpsSvc
echo 完成

ECHO 关闭远程协助
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /d 0 /t REG_dword /f
echo 完成

ECHO 清除右键多余菜单
regsvr32 /u /s igfxpph.dll
reg delete HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers /f
reg add HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\new /ve /d {D969A300-E7FF-11d0-A93B-00A0C90F2719}
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v HotKeysCmds /f
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v IgfxTray /f
echo 完成

ECHO 去除快捷方式后缀
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer" /v link /d "00000000" /t REG_BINARY /f
del "%userprofile%\AppData\Local\iconcache.db" /f /q
echo 完成

ECHO 禁止一联网就打开浏览器
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkConnectivityStatusIndicator" /v "NoActiveProbe" /d 1 /t REG_DWORD /f
echo 完成

ECHO 去除UAC小盾牌
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v 77 /d "%systemroot%\system32\imageres.dll,197" /t reg_sz /f
taskkill /f /im explorer.exe
attrib -s -r -h "%userprofile%\AppData\Local\iconcache.db"
del "%userprofile%\AppData\Local\iconcache.db" /f /q
start explorer
echo 完成

ECHO 卸载OneDrive
taskkill /f /im OneDrive.exe   
taskkill /f /im explorer.exe    
if exist %SYSTEMROOT%\SysWOW64\OneDriveSetup.exe (    
%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe /uninstall    
) else (    //如果不是
%SYSTEMROOT%\System32\OneDriveSetup.exe /uninstall    
)
rd  /s /q "%USERPROFILE%\OneDrive"    
rd  /s /q "%LOCALAPPDATA%\Microsoft\OneDrive"   
rd  /s /q "%PROGRAMDATA%\Microsoft OneDrive"    
reg delete "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f    
reg delete "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f   
start explorer
echo 完成
