; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; NEEDS QUERY START PACK
;; http://www.jrsoftware.org/isdl.php

;[ISSI]
;;#define Debug

;; define some version parameters
;; from http://stackoverflow.com/questions/357803/automated-build-version-number-with-wix-inno-setup-and-vs2008
;; or maybe http://agiletracksoftware.com/blog.html?id=4
#define AppName "HydroDesktop 1.5"
#define SrcApp "HydroDesktop_1_5.exe"
#define FileVerStr GetFileVersion(SrcApp)
;#define StripBuild(str VerStr) Copy(VerStr, 1, RPos(".", VerStr)-1)
#define StripBuild(VerStr) Copy(VerStr, 1, RPos(".", VerStr)-1)
#define AppVerStr StripBuild(FileVerStr)
;#define MyAppPublisher "CUAHSI"
;#define MyAppURL "http://www.hydrodesktop.org"
;#define MyAppExeName "MapWindow.exe"
;#define MyAppVerName "0.9"
;#define MyOutputBaseFilename "HydroDesktop09_Installer"

;;"MapWindowx86-installer"
;;"MapWindowx86Full-v48RC1-installer"

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
;; Create a link to a web page in the Setup Wizard using multilingual custom messages:
;#define ISSI_URL
;#define ISSI_UrlText

;; ISSI Languages with license file
;#define ISSI_Dutch "C:\ISSI\license.txt"

; Include ISSI
;#define ISSI_IncludePath "Source\..\..\ISSI"
;#include ISSI_IncludePath+"\_issi.isi"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{A914416C-9FC5-49FB-B740-70D7F4B6DC07}

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
OutputBaseFilename="HydroDesktop15_Installer"

;install to a separate directory
UsePreviousAppDir=no

;SetupIconFile=Source\..\..\Documents\MapWindow.ico
;UninstallDisplayIcon=Source\..\..\Documents\MapWindow.ico
ChangesAssociations=true
Compression=lzma/Normal
SolidCompression=true
InternalCompressLevel=Normal
;WizardImageFile=Source\..\..\Documents\WizImage-MW.bmp
;WizardSmallImageFile=Source\..\..\Documents\WizSmallImage-MW.bmp
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

Source: "..\Binaries\Help\html\*"; DestDir: "{app}\Help\html"; Flags: ignoreversion recursesubdirs;
Source: "..\Documentation\HydroDesktop_Quick_Start_Guide_1.4.pdf"; DestDir: "{app}\Help\html"; Flags: ignoreversion;

Source: "..\Binaries\Plugins\DataAggregation\DataAggregation.dll"; DestDir: "{app}\Plugins\DataAggregation"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\DataDownload\*"; DestDir: "{app}\Plugins\DataDownload"; Flags: ignoreversion;

Source: "..\Binaries\Plugins\ImportFromWaterML\DataImport.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\ImportFromWaterML\Wizard.Controls.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\ImportFromWaterML\Wizard.UI.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\ExportToCSV\ExportToCSV.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\ExcelExtension\Excel.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\ExcelExtension\ExcelExtension.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\ExcelExtension\ICSharpCode.SharpZipLib.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;

Source: "..\DotSpatial.Plugins.AttributeDataExplorer\Lib\net40-client\DotSpatial.Plugins.AttributeDataExplorer.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.AttributeDataExplorer\Lib\net40-client\DevExpress.Data.v11.2.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.AttributeDataExplorer\Lib\net40-client\DevExpress.Printing.v11.2.Core.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.AttributeDataExplorer\Lib\net40-client\DevExpress.Utils.v11.2.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.AttributeDataExplorer\Lib\net40-client\DevExpress.XtraEditors.v11.2.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.AttributeDataExplorer\Lib\net40-client\DevExpress.XtraGrid.v11.2.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.AttributeDataExplorerLib\net40-client\\DevExpress.XtraLayout.v11.2.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;

Source: "..\BruTile\Lib\net40-client\BruTile.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.WebMap\DotSpatial.Plugins.WebMap.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;

Source: "..\Binaries\Plugins\EditView\EditView.dll*"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\ZedGraph.dll*"; DestDir: "{app}"; Flags: ignoreversion;

Source: "..\Binaries\Plugins\EPADelineation\EPADelineation.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\EPADelineation\Newtonsoft.Json.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;

Source: "..\GeostatisticalTool\Lib\net40-client\GeostatisticalTool.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;

Source: "..\Binaries\Plugins\HydroModeler\Oatc.OpenMI.*.dll"; DestDir: "{app}\Plugins\HydroModeler"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\HydroModeler\OpenMI.Standard.dll"; DestDir: "{app}\Plugins\HydroModeler"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\HydroModeler\HydroModeler.dll"; DestDir: "{app}\Plugins\HydroModeler"; Flags: ignoreversion;

Source: "..\Binaries\Plugins\HydroR\HydroR.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\MetadataFetcher\MetadataFetcher.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;

Source: "..\Binaries\Plugins\Search3\Search3.dll"; DestDir: "{app}\Plugins\Search3"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\Search3\Resources\OntologyTree.xml"; DestDir: "{app}\Plugins\Search3\Resources"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\Search3\Resources\Synonyms.xml"; DestDir: "{app}\Plugins\Search3\Resources"; Flags: ignoreversion;

Source: "..\Binaries\Plugins\TableView\TableView.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\GraphView\GraphView.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;
Source: "..\Binaries\Plugins\HelpTab\HelpTab.dll"; DestDir: "{app}\Plugins"; Flags: ignoreversion;

Source: "..\DotSpatial.Plugins.Ribbon\DevExpress.Data.v11.2.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.Ribbon\DevExpress.Utils.v11.2.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.Ribbon\DevExpress.XtraBars.v11.2.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.Ribbon\DevExpress.XtraEditors.v11.2.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\Binaries\Application Extensions\HydroDesktop.Docking.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\Binaries\Application Extensions\HydroDesktop.Help.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\Binaries\Application Extensions\HydroDesktop.MainPlugin.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\Binaries\Application Extensions\HydroDesktop.SeriesView.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\Binaries\Application Extensions\NuGet.Core.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\Binaries\Application Extensions\WeifenLuo.WinFormsUI.Docking.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\Binaries\Application Extensions\DotSpatial.Plugins.ExtensionManager.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.MenuBar\DotSpatial.Plugins.MenuBar.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\DotSpatial.Plugins.Ribbon\DotSpatial.Plugins.Ribbon.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;
Source: "..\Binaries\Application Extensions\HydroDesktop.SplashScreenManager.dll"; DestDir: "{app}\Application Extensions"; Flags: ignoreversion;

Source: "..\Binaries\System.Data.SQLite.dll"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\HydroDesktopSplashLogo.png"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\HydroDesktop_1_5.exe"; DestDir: "{app}"; Flags: ignoreversion;
Source: "..\Binaries\HydroDesktop_1_5.exe.config"; DestDir: "{app}"; Flags: ignoreversion;

;Source: "..\Binaries\Maps\*"; DestDir: "{app}\Maps"; Flags: recursesubdirs

;Example Configurations for HydroModeler and Sample Projects for HD
Source: "hydromodeler_example_configurations\*"; DestDir: "{app}\Plugins\HydroModeler\hydromodeler_example_configurations"; Flags: recursesubdirs
Source: "hydrodesktop_sample_projects\*"; DestDir: "{app}\hydrodesktop_sample_projects"; Flags: recursesubdirs

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
Type: files; Name: "{app}\Application Extensions\*"
Type: files; Name: "{app}\Application Extensions\DotSpatial.Plugins.DockManager.dll"
Type: files; Name: "{app}\DotSpatial.Common.dll"
Type: files; Name: "{app}\DotSpatial.Desktop.dll"
Type: files; Name: "{app}\NDepend.Helpers.FileDirectoryPath.dll"
Type: files; Name: "{app}\FluentNHibernate.dll"
Type: files; Name: "{app}\NHibernate.dll"
Type: files; Name: "{app}\Plugins\1_SeriesView.*"
Type: files; Name: "{app}\Plugins\FetchBasemap.*"
Type: files; Name: "{app}\Plugins\FetchBasemap\*"
Type: files; Name: "{app}\Plugins\TSA\*"
Type: files; Name: "{app}\Plugins\TSA.*"
Type: files; Name: "{app}\Plugins\Toolbox.*"
Type: files; Name: "{app}\Plugins\Search2\*"
Type: files; Name: "{app}\Plugins\Search\search.*"
Type: files; Name: "{app}\Plugins\HelpTab\DataDownload.dll"
Type: files; Name: "{app}\Plugins\MetadataFetcher\HIS_Database.*"
Type: files; Name: "{app}\Plugins\DataFetcher\HIS_Database.*"
Type: files; Name: "{app}\Plugins\ImportFromWaterML\ImportFromWaterML.*"
Type: files; Name: "{app}\HydroDesktop.Database.*"
Type: files; Name: "{app}\HydroDesktop.Help.*"
Type: files; Name: "{app}\HydroDesktop.DataModel.*"
Type: files; Name: "{app}\HydroDesktop.WebServices.*"
Type: files; Name: "{app}\FetchBasemap\FetchBasemap.*"
Type: files; Name: "{app}\settings.xml"
Type: files; Name: "{app}\q_save.xml"
Type: files; Name: "{app}\System.Windows.Forms.Ribbon35.dll"
Type: files; Name: "{app}\Plugins\WebMap\DotSpatial.Plugins.ExtensionManager.dll"
Type: files; Name: "{app}\hydrodesktop_log.txt"

Type: files; Name: "{app}\Plugins\DataAggregation\DataAggregation.dll"
Type: files; Name: "{app}\Plugins\DataAggregation\DataAggregation.pdb"
Type: files; Name: "{app}\Plugins\DataAggregation\DataAggregation.xml"
Type: files; Name: "{app}\Plugins\DataAggregation\HydroDestkop.Configuration.dll"
Type: files; Name: "{app}\Plugins\DataAggregation\HydroDestkop.Configuration.pdb"
Type: files; Name: "{app}\Plugins\DataImport\DataImport.dll"
Type: files; Name: "{app}\Plugins\DataImport\Excel.dll"
Type: files; Name: "{app}\Plugins\DataImport\ICSharpCode.SharpZipLib.dll"
Type: files; Name: "{app}\Plugins\DataImport\Wizard.Controls.dll"
Type: files; Name: "{app}\Plugins\DataImport\Wizard.UI.dll"
Type: files; Name: "{app}\Plugins\EditView\EditView.dll"
Type: files; Name: "{app}\Plugins\EditView\ZedGraph.dll"
Type: files; Name: "{app}\Plugins\EPADelineation\EPADelineation.dll"
Type: files; Name: "{app}\Plugins\EPADelineation\Newtonsoft.Json.dll"
Type: files; Name: "{app}\Plugins\ExportToCSV\ExportToCSV.dll"
Type: files; Name: "{app}\Plugins\ExportToCSV\HydroDesktop.Common.dll"
Type: files; Name: "{app}\Plugins\GeostatisticalTool\GeostatisticalTool.dll"
Type: files; Name: "{app}\Plugins\GeostatisticalTool\ZedGraph.dll"
Type: files; Name: "{app}\Plugins\GraphView\GraphView.dll"
Type: files; Name: "{app}\Plugins\GraphView\ZedGraph.dll"
Type: files; Name: "{app}\Plugins\HelpTab\HelpTab.dll"
Type: files; Name: "{app}\Plugins\HydroR\HydroR.dll"
Type: files; Name: "{app}\Plugins\HydroR\HydroR_1.2.tar.gz"
Type: files; Name: "{app}\Plugins\MetadataFetcher\MetadataFetcher.dll"
Type: files; Name: "{app}\Plugins\TableView\TableView.dll"
Type: files; Name: "{app}\Plugins\WebMap\BruTile.dll"
Type: files; Name: "{app}\Plugins\WebMap\DotSpatial.Plugins.WebMap.dll"
Type: files; Name: "{app}\Plugins\ZDataDownload\DataDownload.dll"
Type: files; Name: "{app}\Plugins\ZDataDownload\Log4net.dll"

Type: files; Name: "{userappdata}\HydroDesktop.exe\*"
Type: files; Name: "{userappdata}\HydroDesktop\*"
Type: files; Name: "{userappdata}\HydroDesktop_1_4.exe\*"
Type: files; Name: "{userappdata}\HydroDesktop_1_4\*"
Type: files; Name: "{userappdata}\hydrodesktop_log.txt"

[UninstallDelete]
Type: files; Name: "{app}\Application Extensions\*"
Type: files; Name: "{app}\Application Extensions\DotSpatial.Plugins.DockManager.dll"
Type: files; Name: "{app}\DotSpatial.Common.dll"
Type: files; Name: "{app}\DotSpatial.Desktop.dll"
Type: files; Name: "{app}\NDepend.Helpers.FileDirectoryPath.dll"
Type: files; Name: "{app}\FluentNHibernate.dll"
Type: files; Name: "{app}\NHibernate.dll"
Type: files; Name: "{app}\Plugins\1_SeriesView.*"
Type: files; Name: "{app}\Plugins\FetchBasemap.*"
Type: files; Name: "{app}\Plugins\FetchBasemap\*"
Type: files; Name: "{app}\Plugins\TSA\*"
Type: files; Name: "{app}\Plugins\TSA.*"
Type: files; Name: "{app}\Plugins\Toolbox.*"
Type: files; Name: "{app}\Plugins\Search2\*"
Type: files; Name: "{app}\Plugins\Search\search.*"
Type: files; Name: "{app}\Plugins\HelpTab\DataDownload.dll"
Type: files; Name: "{app}\Plugins\MetadataFetcher\HIS_Database.*"
Type: files; Name: "{app}\Plugins\DataFetcher\HIS_Database.*"
Type: files; Name: "{app}\Plugins\ImportFromWaterML\ImportFromWaterML.*"
Type: files; Name: "{app}\HydroDesktop.Database.*"
Type: files; Name: "{app}\HydroDesktop.Help.*"
Type: files; Name: "{app}\HydroDesktop.DataModel.*"
Type: files; Name: "{app}\HydroDesktop.WebServices.*"
Type: files; Name: "{app}\FetchBasemap\FetchBasemap.*"
Type: files; Name: "{app}\settings.xml"
Type: files; Name: "{app}\q_save.xml"
Type: files; Name: "{app}\System.Windows.Forms.Ribbon35.dll"
Type: files; Name: "{app}\Plugins\WebMap\DotSpatial.Plugins.ExtensionManager.dll"
Type: files; Name: "{app}\hydrodesktop_log.txt"

Type: files; Name: "{app}\Plugins\DataAggregation\DataAggregation.dll"
Type: files; Name: "{app}\Plugins\DataAggregation\HydroDestkop.Configuration.dll"
Type: files; Name: "{app}\Plugins\DataImport\DataImport.dll"
Type: files; Name: "{app}\Plugins\DataImport\Excel.dll"
Type: files; Name: "{app}\Plugins\DataImport\ICSharpCode.SharpZipLib.dll"
Type: files; Name: "{app}\Plugins\DataImport\Wizard.Controls.dll"
Type: files; Name: "{app}\Plugins\DataImport\Wizard.UI.dll"
Type: files; Name: "{app}\Plugins\EditView\EditView.dll"
Type: files; Name: "{app}\Plugins\EditView\ZedGraph.dll"
Type: files; Name: "{app}\Plugins\EPADelineation\EPADelineation.dll"
Type: files; Name: "{app}\Plugins\EPADelineation\Newtonsoft.Json.dll"
Type: files; Name: "{app}\Plugins\ExportToCSV\ExportToCSV.dll"
Type: files; Name: "{app}\Plugins\ExportToCSV\HydroDesktop.Common.dll"
Type: files; Name: "{app}\Plugins\GeostatisticalTool\GeostatisticalTool.dll"
Type: files; Name: "{app}\Plugins\GeostatisticalTool\ZedGraph.dll"
Type: files; Name: "{app}\Plugins\GraphView\GraphView.dll"
Type: files; Name: "{app}\Plugins\GraphView\ZedGraph.dll"
Type: files; Name: "{app}\Plugins\HelpTab\HelpTab.dll"
Type: files; Name: "{app}\Plugins\HydroR\HydroR.dll"
Type: files; Name: "{app}\Plugins\HydroR\HydroR_1.2.tar.gz"
Type: files; Name: "{app}\Plugins\MetadataFetcher\MetadataFetcher.dll"
Type: files; Name: "{app}\Plugins\TableView\TableView.dll"
Type: files; Name: "{app}\Plugins\WebMap\BruTile.dll"
Type: files; Name: "{app}\Plugins\WebMap\DotSpatial.Plugins.WebMap.dll"
Type: files; Name: "{app}\Plugins\ZDataDownload\DataDownload.dll"
Type: files; Name: "{app}\Plugins\ZDataDownload\Log4net.dll"

Type: files; Name: "{userappdata}\HydroDesktop.exe\*"
Type: files; Name: "{userappdata}\HydroDesktop\*"
Type: files; Name: "{userappdata}\HydroDesktop_1_4.exe\*"
Type: files; Name: "{userappdata}\HydroDesktop_1_4\*"
Type: files; Name: "{userappdata}\hydrodesktop_log.txt"

[Dirs]
Name: {app}; Permissions: everyone-modify
Name: {app}\Maps; Permissions: everyone-modify
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
