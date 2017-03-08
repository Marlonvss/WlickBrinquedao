#define MyAppName "Brinquedoteca"
#define MyAppVersion "1.0.0.10"
#define MyAppPublisher "WebLick"
#define MyAppURL "http://www.weblick.com.br"
#define MyAppExeName "ControleBrinquedao.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{71419CEF-5E96-4965-81C9-EDC4203BDAB8}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=C:\WLick\
DefaultGroupName={#MyAppName}
OutputDir=C:\Projects\InstallPostgre\output
OutputBaseFilename=SetupProgram
Compression=lzma
SolidCompression=yes

[Languages]
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "D:\Projects\InstallPostgre\jars\Program.jar"; DestDir: "{app}"; Flags: ignoreversion
Source: "D:\Projects\InstallPostgre\jars\lib\*.*"; DestDir:{app}\lib; 
Source: "D:\Projects\InstallPostgre\files\postgresql.exe"; DestDir:{tmp}; 

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: shellexec postinstall skipifsilent
Filename: "{tmp}\postgresql.exe"; Flags: runminimized;  StatusMsg: Instalando PostgreSQL; Parameters:  --mode unattended --unattendedmodeui minimal --superpassword root --prefix C:\Program\postgres --datadir C:\Program\data
;--create_shortcuts 0 (Adicione para não criar atalhos no postgre)