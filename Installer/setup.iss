; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; NEEDS QUERY START PACK
;; http://www.jrsoftware.org/isdl.php

;[ISSI]
;;#define Debug

;; define some version parameters
;; from http://stackoverflow.com/questions/357803/automated-build-version-number-with-wix-inno-setup-and-vs2008
;; or maybe http://agiletracksoftware.com/blog.html?id=4
#define AppName "HydroDesktop 1.7.3"
#define SrcApp "HydroDesktop_1_7_3.exe"
#define FileVerStr GetFileVersion(SrcApp)
;#define StripBuild(str VerStr) Copy(VerStr, 1, RPos(".", VerStr)-1)
#define StripBuild(VerStr) Copy(VerStr, 1, RPos(".", VerStr)-1)
#define AppVerStr StripBuild(FileVerStr)
;#define MyAppPublisher "CUAHSI"
;#define MyAppURL "http://www.hydrodesktop.org"
;#define MyOutputBaseFilename "HydroDesktop09_Installer"

;; Include ALL languages
;#define ISSI_Languages

;; Create an About button in the Setup Wizard
;#define ISSI_About  "{cm:issiAbout}"
;; Set date-time format and seperator
;#define ISSI_Constants "YYMDHMS"
;#define ISSI_ConstantsSeperator "."
;; Create a print button on the License page
;#define ISSI_LicensePrint
; Add BeveledLabel message (leave empty for default "Inno Setup" value)
;#define ISSI_BeveledLabel "HydroDesktop"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{52A4C3C0-3B01-4455-B3DF-CE7BCADCB714}

PrivilegesRequired=poweruser
MinVersion=,5.01
; Necessary setting for the 64bit version
ArchitecturesInstallIn64BitMode="x64 ia64"
AppName={#AppName}
AppVersion={#AppVerStr}
AppVerName={#AppName} {#AppVerStr}
UninstallDisplayName={#AppName} {#AppVerStr}
VersionInfoVersion={#FileVerStr}
VersionInfoTextVersion={#AppVerStr}
;OutputBaseFilename=MyApp-{#FileVerStr}-setup
AppPublisher="CUAHSI"
AppPublisherURL="www.cuahsi.org"
AppSupportURL="www.hydrodesktop.org"
AppUpdatesURL="www.hydrodesktop.org"
AppCopyright=Copyright � CUAHSI 2009-2012
AppContact="www.hydrodesktop.org"
VersionInfoCompany=CUAHSI [www.cuahsi.org]
VersionInfoCopyright=Mozilla Public License (MPL) 1.1
VersionInfoDescription=HydroDesktop [www.HydroDesktop.org]
VersionInfoProductName="{#AppName} {#AppVerStr}
VersionInfoProductVersion={#AppVerStr}
DefaultDirName={pf}\CUAHSI HIS\{#AppName}
DefaultGroupName=CUAHSI HIS\{#AppName}
;If this is set to auto, at startup Setup will look in the registry
;to see if the same application is already installed, and if so, it
;will not show the Select Start Menu Folder wizard page.
AllowNoIcons=true
AlwaysShowComponentsList=false
;LicenseFile=Source\App\license.rtf
;InfoBeforeFile=Source\..\..\Documents\Pre-install.txt
;InfoAfterFile=Source\..\..\Documents\Post-install.txt
OutputDir=Releases
OutputBaseFilename="HydroDesktop16_Installer"

;install to a separate directory
UsePreviousAppDir=no

;SetupIconFile=HydroDesktop.ico
;UninstallDisplayIcon=HydroDesktop.ico
ChangesAssociations=true
Compression=lzma2/ultra64
SolidCompression=true
InternalCompressLevel=ultra64
WizardImageFile=SetupImage.bmp
WizardSmallImageFile=SetupImageSmall.bmp
;#ifdef Debug
;SetupLogging=true
;#endif
;[Languages]

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\Binaries\HydroDesktop.*.dll"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\DotSpatial.*.dll"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\Microsoft.*.dll"; DestDir: "{app}"; Flags: ignoreversion;

Source: "..\Documentation\HydroDesktop_Quick_Start_Guide_1.5.pdf"; DestDir: "{app}\Help\html"; Flags: ignoreversion;
Source: "..\Documentation\HydroDesktop User Guide.pdf"; DestDir: "{app}\Help\html"; Flags: ignoreversion;

Source: "..\Binaries\ZedGraph.dll*"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\x86\SQLite.Interop.dll"; DestDir: "{app}\x86"; Flags: ignoreversion;
Source: "..\Binaries\x64\SQLite.Interop.dll"; DestDir: "{app}\x64"; Flags: ignoreversion;
Source: "..\Binaries\HydroDesktopSplashLogo.png"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\HydroDesktop_1_6_dev.exe"; DestDir: "{app}"; DestName: "{#SrcApp}"; Flags: ignoreversion;
Source: "..\Binaries\HydroDesktop_1_6_dev.exe.config"; DestDir: "{app}"; DestName: "{#SrcApp}.config"; Flags: ignoreversion;

;Plugins
Source: "..\Binaries\Plugins\*"; DestDir: "{commonappdata}\{#SrcApp}\Extensions\Packages"; Flags: recursesubdirs ignoreversion;
Source: "..\Source\packages\DotSpatial.Plugins.ExtensionManager.1.1.3\*"; DestDir: "{commonappdata}\{#SrcApp}\Extensions\Packages\DotSpatial.Plugins.ExtensionManager.1.1.3"; Flags: recursesubdirs ignoreversion;
Source: "..\Source\packages\DotSpatial.Plugins.MenuBar.1.0.1200\*"; DestDir: "{commonappdata}\{#SrcApp}\Extensions\Packages\DotSpatial.Plugins.MenuBar.1.0.1200"; Flags: recursesubdirs ignoreversion;
Source: "..\Source\packages\DotSpatial.Plugins.Ribbon.1.4.38\*"; DestDir: "{commonappdata}\{#SrcApp}\Extensions\Packages\DotSpatial.Plugins.Ribbon.1.4.38"; Flags: recursesubdirs ignoreversion;
Source: "..\Source\packages\DotSpatial.Plugins.WebMap.1.1.0.0\*"; DestDir: "{commonappdata}\{#SrcApp}\Extensions\Packages\DotSpatial.Plugins.WebMap.1.1.0.0"; Flags: recursesubdirs ignoreversion;

;Windows Specific Folders
Source: "..\Binaries\Support\Windows\*"; DestDir: "{app}\Support\Windows\"; Flags: ignoreversion;

[Icons]
Name: "{group}\{#AppName}"; Filename: "{app}\{#SrcApp}"
Name: "{group}\{cm:UninstallProgram,{#AppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#AppName}"; Filename: "{app}\{#SrcApp}"; Tasks: desktopicon

[Registry]
Root: HKCR; Subkey: ".dspx"; ValueType: string; ValueName: ""; ValueData: "HD_Project"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "HD_Project"; ValueType: string; ValueName: ""; ValueData: "HydroDesktop Project"; Flags: uninsdeletekey 
Root: HKCR; Subkey: "HD_Project\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#SrcApp},0"
Root: HKCR; Subkey: "HD_Project\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#SrcApp}"" ""%1"""

;[Run]
;Start HydroDesktop
;Filename: "{app}\HydroDesktop.exe"; Description: "{cm:LaunchProgram,HydroDesktop}"; Flags: nowait postinstall skipifsilent

[InstallDelete]
Type: filesandordirs; Name: "{app}\*"
Type: files; Name: "{userappdata}\hydrodesktop_log.txt"
Type: filesandordirs; Name: "{localappdata}\CUAHSI\{#SrcApp}*"
Type: filesandordirs; Name: "{localappdata}\Temp\HydroDesktop"
Type: filesandordirs; Name: "{commonappdata}\{#SrcApp}"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*"
Type: files; Name: "{userappdata}\hydrodesktop_log.txt"
Type: filesandordirs; Name: "{localappdata}\CUAHSI\{#SrcApp}*"
Type: filesandordirs; Name: "{localappdata}\Temp\HydroDesktop"
Type: filesandordirs; Name: "{commonappdata}\{#SrcApp}"

[Dirs]
Name: {app}; Permissions: everyone-modify; Flags: uninsalwaysuninstall
Name: {app}\Maps; Permissions: everyone-modify; Flags: uninsalwaysuninstall
Name: {commonappdata}\{#SrcApp}; Permissions: everyone-full; Flags: uninsalwaysuninstall
; not yet capable of moving stuff outside of the HD folder reliably
;Name: {userdocs}\HydroDesktop\default; Permissions: everyone-modify

[Code]
function MsiQueryProductState(ProductCode: string): integer;
external 'MsiQueryProductStateA@msi.dll';

const
  INSTALLSTATE_DEFAULT = 5;
  INSTALLLEVEL_MAXIMUM = $ffff;
  INSTALLSTATE_ABSENT = 2;

function IsDotNET20Detected(): boolean;
var
  NetSuccess: boolean;
  NetInstall: cardinal;
begin
  NetSuccess := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727', 'Install', NetInstall);
  Result := NetSuccess and (NetInstall = 1);

//#ifdef Debug
//  if Result then
//		MsgBox('Found DotNET20', mbInformation, MB_OK);
//#endif

end;

function IsDotNET35Detected(): boolean;
var
  NetSuccess: boolean;
  NetInstall: cardinal;
begin
  NetSuccess := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5', 'Install', NetInstall);
  Result := NetSuccess and (NetInstall = 1);

//#ifdef Debug
//  if Result then
//		MsgBox('Found DotNET35', mbInformation, MB_OK);
//#endif
end;

function IsDotNetDetected(version: string; service: cardinal): boolean;
// Indicates whether the specified version and service pack of the .NET Framework is installed.
//
// version -- Specify one of these strings for the required .NET Framework version:
//    'v1.1.4322'     .NET Framework 1.1
//    'v2.0.50727'    .NET Framework 2.0
//    'v3.0'          .NET Framework 3.0
//    'v3.5'          .NET Framework 3.5
//    'v4\Client'     .NET Framework 4.0 Client Profile
//    'v4\Full'       .NET Framework 4.0 Full Installation
//
// service -- Specify any non-negative integer for the required service pack level:
//    0               No service packs required
//    1, 2, etc.      Service pack 1, 2, etc. required
var
    key: string;
    install, serviceCount: cardinal;
    success: boolean;
begin
    key := 'SOFTWARE\Microsoft\NET Framework Setup\NDP\' + version;
    // .NET 3.0 uses value InstallSuccess in subkey Setup
    if Pos('v3.0', version) = 1 then begin
        success := RegQueryDWordValue(HKLM, key + '\Setup', 'InstallSuccess', install);
    end else begin
        success := RegQueryDWordValue(HKLM, key, 'Install', install);
    end;
    // .NET 4.0 uses value Servicing instead of SP
    if Pos('v4', version) = 1 then begin
        success := success and RegQueryDWordValue(HKLM, key, 'Servicing', serviceCount);
    end else begin
        success := success and RegQueryDWordValue(HKLM, key, 'SP', serviceCount);
    end;
    result := success and (install = 1) and (serviceCount >= service);
end;

function IsDotNet40Detected(): boolean;
begin
  Result := IsDotNetDetected('v4\Client', 0);
end;


function IsMsiProductInstalled(const ProductId: string): boolean;
begin
	Result := MsiQueryProductState(ProductId) = INSTALLSTATE_DEFAULT;
end;

//http://download.microsoft.com/download/7/B/6/7B629E05-399A-4A92-B5BC-484C74B5124B/dotNetFx40_Client_setup.exe
function InstallDotNET40Client(): boolean;
var
	ExpectedLocalLocation: String;
	ErrorCode: Integer;
begin
	ExpectedLocalLocation := ExpandConstant('{src}') + '\' + 'dotNetFx40_Client_setup';
	if not FileExists(ExpectedLocalLocation) then
		ExpectedLocalLocation := ExpandConstant('{src}') + '\' + 'dotNetFx40_Client_setup.exe';

	if FileExists(ExpectedLocalLocation) then
	begin
		ShellExec('open', ExpectedLocalLocation, '', '', SW_SHOW, ewNoWait, ErrorCode);
		Result := MsgBox('Ready to continue HydroDesktop installation?' #13#13 '(Click Yes after installing .Net Framework 4.0 Client )', mbConfirmation, MB_YESNO) = idYes;
	end
	else
	begin
		if MsgBox('The .Net Framework 4.0 Client is required but was not found.' #13#13 'Open the web page for downloading .Net 4.0 Client now?', mbConfirmation, MB_YESNO) = idYes	then
		begin
			ShellExec('open', 'http://download.microsoft.com/download/7/B/6/7B629E05-399A-4A92-B5BC-484C74B5124B/dotNetFx40_Client_setup.exe', '', '', SW_SHOW, ewNoWait, ErrorCode)
			Result := MsgBox('Ready to continue HydroDesktop installation?' #13#13 '(Click Yes after installing .Net Framework 4.0 Client)', mbConfirmation, MB_YESNO) = idYes;
		end
		else
			Result := MsgBox('.Net 4.0 Client Framework is required but was not found.' #13#13 'Continue HydroDesktop installation?', mbConfirmation, MB_YESNO) = idYes;
	end;
end;

function InstallDotNET(versionDotNET: string; file1: String; file2: String; urlFamilyID: String): Boolean;
var
	ExpectedLocalLocation: String;
	ErrorCode: Integer;
begin
	ExpectedLocalLocation := ExpandConstant('{src}') + '\' + file1;
	if not FileExists(ExpectedLocalLocation) then
		ExpectedLocalLocation := ExpandConstant('{src}') + '\' + file2;

	if FileExists(ExpectedLocalLocation) then
	begin
		ShellExec('open', ExpectedLocalLocation, '', '', SW_SHOW, ewNoWait, ErrorCode);
		Result := MsgBox('Ready to continue HydroDesktop installation?' #13#13 '(Click Yes after installing .Net Framework ' + versionDotNET + ')', mbConfirmation, MB_YESNO) = idYes;
	end
	else
	begin
		if MsgBox('The .Net Framework ' + versionDotNET + ' is required but was not found.' #13#13 'Open the web page for downloading .Net ' + versionDotNET + ' now?', mbConfirmation, MB_YESNO) = idYes	then
		begin
			ShellExec('open', 'http://www.microsoft.com/downloads/details.aspx?FamilyID=' + urlFamilyID, '', '', SW_SHOW, ewNoWait, ErrorCode)
			Result := MsgBox('Ready to continue MapWindow installation?' #13#13 '(Click Yes after installing .Net Framework ' + versionDotNET + ')', mbConfirmation, MB_YESNO) = idYes;
		end
		else
			Result := MsgBox('.Net ' + versionDotNET + ' Framework is required but was not found.' #13#13 'Continue HydroDesktop installation?', mbConfirmation, MB_YESNO) = idYes;
	end;
end;

function CheckDotNetVersions(): Boolean;
begin
  // v2.0
  Result := IsDotNET20Detected();
  if not Result then
  begin
    Result := InstallDotNET('v2.0', 'dotnetfx20.exe', 'dotnetfx_v2.0.exe', '79BC3B77-E02C-4AD3-AACF-A7633F706BA5');
	end;

  // v3.5
  Result := IsDotNET35Detected();
  if not Result then
  begin
    Result := InstallDotNET('v3.5', 'dotnetfx35.exe', 'dotnetfx_v3.5.exe', 'AB99342F-5D1A-413D-8319-81DA479AB0D7');
	end;
  // v4.0
  Result := IsDotNET40Detected();
  if not Result then
  begin
    Result := InstallDotNET('v4.0', 'dotnetfx40.exe', 'dotnetfx_v4.0.exe', '7B629E05-399A-4A92-B5BC-484C74B5124B');
  end;
  
  
  
  
end;



	
function IsX64: Boolean;
begin
	Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function IsIA64: Boolean;
begin
	Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;

function GetURL(x86, x64, ia64: String): String;
begin
	if IsX64() and (x64 <> '') then
		Result := x64;
	if IsIA64() and (ia64 <> '') then
		Result := ia64;
	
	if Result = '' then
		Result := x86;
end;

procedure CurUninstallStepChanged (CurUninstallStep: TUninstallStep);
var
  mres : integer;
begin
  case CurUninstallStep of
    usPostUninstall:
      begin
        DelTree(ExpandConstant('{userappdata}\Hydrodesktop.exe'), True, True, True);
      end;  
  end;
end;	

procedure DeletePackages;
begin
   DelTree(ExpandConstant('{userappdata}\Hydrodesktop.exe'), True, True, True);
end;  


function InitializeSetup(): Boolean;
begin  
  DeletePackages();
  
  // Check for .NET prerequisites
	Result := CheckDotNetVersions();
	
end;
