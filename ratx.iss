; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "RATX Launcher"
#define MyAppVersion "1.0"
#define MyAppPublisher "RNX DEV TEAM"
#define MyAppURL "https://www.github.com/ren0x1/"
#define MyAppExeName "Ren0XLauncher.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{B1937F74-45E1-40FF-8D42-D39BA05AD3EB}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName=FiveM.app\{#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=C:\Users\alex-\Desktop\Launcher\gpl-3.0.txt
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=C:\Users\alex-\Desktop\New folder
OutputBaseFilename=RATXLauncher
SetupIconFile=F:\DISE?OS\RATX\favicon.ico
Password=renox1
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "C:\Users\alex-\Desktop\Launcher\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\DiscordRPC.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\gpl-3.0.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\MaterialDesignColors.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\MaterialDesignThemes.Wpf.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\Newtonsoft.Json.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\Ren0XLauncher.deps.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\Ren0XLauncher.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\Ren0XLauncher.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\Ren0XLauncher.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\Ren0XLauncher.runtimeconfig.dev.json"; DestDir: "{app}"; Flags: ignoreversion
Source: "C:\Users\alex-\Desktop\Launcher\Ren0XLauncher.runtimeconfig.json"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

