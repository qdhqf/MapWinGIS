; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

[ISSI]
;; Include ALL languages
#define ISSI_Languages
;#define x64BitVersion

;; Create an About button in the Setup Wizard
#define ISSI_About  "{cm:issiAbout}"
;; Set date-time format and seperator
#define ISSI_Constants "YYMDHMS"
#define ISSI_ConstantsSeperator "."
;; Create a print button on the License page
#define ISSI_LicensePrint
; Add BeveledLabel message (leave empty for default "Inno Setup" value)
#define ISSI_BeveledLabel "MapWindow GIS"
#ifdef x64BitVersion
  #define ISSI_BeveledLabel ISSI_BeveledLabel + " 64 Bit"
#endif
;; Create a link to a web page in the Setup Wizard using multilingual custom messages:
#define ISSI_URL
#define ISSI_UrlText

; Include ISSI
#define ISSI_IncludePath "C:\dev\InstallationProjects\ISSI"
#include ISSI_IncludePath+"\_issi.isi"

#define MyAppName "MapWinGIS"
#define MyAppVersion "4.8.8.0"
#define MyAppPublisher "MapWindow GIS"
#define MyAppURL "http://www.mapwindow.org"
#ifdef x64BitVersion
  #define MyOutputBaseFilename "MapWinGIS-only-v4.8SR-64bit-installer"
#else
  #define MyOutputBaseFilename "MapWinGIS-only-v4.8.8RC1-32bit-installer"
#endif
#define MySourcePath SourcePath

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{4DA288CD-C016-4E9E-B9EA-89799F678A06}
PrivilegesRequired=poweruser
MinVersion=,5.1.2600sp1
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppCopyright=MapWindow development team
AppContact={#MyAppURL}
AppVerName={#MyAppVersion}
DefaultDirName=C:\dev\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=true
LicenseFile=license.rtf
InfoBeforeFile=MapWindowNotes.rtf
OutputDir=C:\dev\MapWinGIS4Dev\Setup
#ifdef x64BitVersion
  SourceDir=C:\dev\MapWindow4Dev\Bin64
#else
  SourceDir=C:\dev\MapWindow4Dev\Bin
#endif
OutputBaseFilename={#MyOutputBaseFilename}
SetupIconFile=MapWindow.ico
Compression=lzma/Ultra
SolidCompression=true
InternalCompressLevel=Ultra
VersionInfoCompany=MapWindow Open Source Team [www.MapWindow.org]
VersionInfoCopyright=Mozilla Public License (MPL) 1.1
VersionInfoDescription=MapWindow GIS [www.MapWindow.org]
VersionInfoProductName={#MyAppName}
VersionInfoProductVersion={#MyAppVersion}
VersionInfoVersion={#MyAppVersion}
WizardImageFile= {#MySourcePath}WizImage-MW.bmp
WizardSmallImageFile= {#MySourcePath}WizSmallImage-MW.bmp
WizardImageStretch=false

[Languages]

[Files]
;C++ Distributables
#ifdef x64BitVersion
  Source: {#MySourcePath}vcfiles\vcredist_x64_2008.exe; DestDir: {tmp}; Flags: deleteafterinstall 64bit ignoreversion
  Source: msvcr90.dll; DestDir: {sys}; Flags: restartreplace 64bit uninsneveruninstall sharedfile
#else
  Source: {#MySourcePath}vcfiles\vcredist_x86_2008.exe; DestDir: {tmp}; Flags: deleteafterinstall 32bit ignoreversion
  Source: {#MySourcePath}vcfiles\msvcr90.dll; DestDir: {sys}; Flags: restartreplace 32bit uninsneveruninstall sharedfile
  Source: {#MySourcePath}vcfiles\msvcp90.dll; DestDir: {sys}; Flags: restartreplace 32bit uninsneveruninstall sharedfile
#endif

Source: netcdf.dll; DestDir: {app}; Flags: ignoreversion 32bit;   
Source: lti_dsdk.dll; DestDir: {app}; Flags: ignoreversion 32bit; 
Source: lti_lidar_dsdk.dll; DestDir: {app}; Flags: ignoreversion 32bit;
Source: NCScnet4.dll; DestDir: {app}; Flags: ignoreversion 32bit;
Source: NCSEcw4_RO.dll; DestDir: {app}; Flags: ignoreversion 32bit;
Source: NCSUtil4.dll; DestDir: {app}; Flags: ignoreversion 32bit;
Source: log4net.dll; DestDir: {app}; Flags: ignoreversion 32bit; 
Source: tbb.dll; DestDir: {app}; Flags: ignoreversion 32bit; 
Source: MapWindowNotes.rtf; DestDir: {app}; Flags: ignoreversion isreadme; 
Source: MapWinGIS.ocx; DestDir: {app}; Flags: ignoreversion 32bit; 
Source: stdole.dll; DestDir: {app}; Flags: ignoreversion 32bit; 
Source: regMapWinGIS.cmd; DestDir: {app}; Flags: ignoreversion 32bit;
Source: SetEnv.exe; DestDir: {app}; Flags: ignoreversion 32bit; 

;;Source: gdal18.dll; DestDir: {app}; Flags: ignoreversion 32bit; 
;;Source: geos_c.dll; DestDir: {app}; Flags: ignoreversion 32bit; 
;;Source: IndexSearching.dll; DestDir: {app}; Flags: ignoreversion 32bit; 
;;Source: proj.dll; DestDir: {app}; Flags: ignoreversion 32bit; 
;;Source: xerces-c_3.dll; DestDir: {app}; Flags: ignoreversion 32bit; 

;; Use a custom cmd file, without notification:
Source: {#MySourcePath}regMapWinGIS.cmd; DestDir: {app}; Flags: ignoreversion
;; GDAL Projection files:
#include SourcePath + '\gdal_data.txt'
#include SourcePath + '\proj_nad.txt'

; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"

[Run]
;Run some command files:
Filename: {app}\regMapWinGIS.cmd; WorkingDir: {app}; Flags: runhidden

[Dirs]
Name: {app}; Permissions: everyone-modify

[CustomMessages]
en.issiAbout=MapWindow Open Source Team [www.MapWindow.org]
nl.issiAbout=Ga voor Nederlandstalige ondersteuning naar www.mapwindow.nl.
en.issiUrl=http://www.mapwindow.org
nl.issiUrl=http://www.mapwindow.nl
en.issiUrlText={#MyAppName}
nl.issiUrlText=Nederlandse ondersteuning
en.RunSurvey=Take a very brief survey after your first use of MapWindow for a chance to win a T-Shirt?
nl.RunSurvey=Wil je een korte enqu�te doen nadat je MapWindow voor het eerst hebt gebruikt? Je kunt er een T-Shirt mee winnen
en.FoundPreviousVersion=Detected a previous version of MapWindow! It will be uninstalled
nl.FoundPreviousVersion=Er is een eerdere versie van MapWindow gevonden! Het zal worden gede�nstalleerd

[Code]
function MsiQueryProductState(ProductCode: PAnsiChar): Integer;
external 'MsiQueryProductStateA@msi.dll stdcall';

const
  INSTALLLEVEL_MAXIMUM = $ffff;
	INSTALLSTATE_BADCONFIG = -6;
	INSTALLSTATE_INCOMPLETE = -5;
	INSTALLSTATE_SOURCEABSENT = -4;
	INSTALLSTATE_MOREDATA = -3;
	INSTALLSTATE_INVALIDARG = -2;      // An invalid parameter was passed to the function.
	INSTALLSTATE_UNKNOWN = -1;         // The product is neither advertised or installed.
	INSTALLSTATE_BROKEN = 0;
	INSTALLSTATE_ADVERTISED = 1;       // The product is advertised but not installed.
  INSTALLSTATE_ABSENT = 2;           // The product is installed for a different user.
	INSTALLSTATE_LOCAL = 3;
	INSTALLSTATE_SOURCE = 4;
  INSTALLSTATE_DEFAULT = 5;          // The product is installed for the current user.

  //Microsoft Visual C++ 2008 Redistributable - x86 9.0.30729.17: {9A25302D-30C0-39D9-BD6F-21E6EC160475}
const
	VCREDIST_X86 = '{9A25302D-30C0-39D9-BD6F-21E6EC160475}';
	VCREDIST_X64 = '{8220EEFE-38CD-377E-8595-13398D740ACE}';
  ErrorInstallVC = 'Error installing the VC++ redistributables!';

function IsDotNET35Detected(): boolean;
var
  NetSuccess: boolean;
  NetInstall: cardinal;
begin
  NetSuccess := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5', 'Install', NetInstall);
  Result := NetSuccess and (NetInstall = 1);
#ifdef Debug
  if Result then
		MsgBox('Found DotNET35', mbInformation, MB_OK);
#endif
end;


function IsMsiProductInstalled(const ProductId: string): boolean;
var
	queryResult: Integer;
begin
#ifdef Debug
	MsgBox('Checking for ' + ProductId, mbInformation, MB_OK);
#endif
	queryResult := MsiQueryProductState(ProductId);

#ifdef Debug
		MsgBox('MsiQueryProductState: ' + IntToStr(queryResult), mbInformation, MB_OK);
#endif

	Result := queryResult = INSTALLSTATE_DEFAULT;
end;

function NeedInstallVC8(): Boolean;
begin

  // Check reg key:
#ifdef x64BitVersion  
	Result := not IsMsiProductInstalled(VCREDIST_X64);
#else
	Result := not IsMsiProductInstalled(VCREDIST_X86);
#endif

#ifdef Debug
  if Result then
  begin
		MsgBox('Could not find VCREDIST, will install', mbInformation, MB_OK);
	end
	else
	begin
		MsgBox('Found VCREDIST, no need to install', mbInformation, MB_OK);
	end;
#endif
end;

// Checks for a MapWinGIS ocx in the given classID. If it's found, it's unregistered and renamed,
// or, failing renaming, deleted.
procedure UnregisterMapWinGIS(clsname: String; Rename: Boolean);
var
  Path: String;
begin
  try
    if RegQueryStringValue(HKEY_CLASSES_ROOT, 'CLSID\' + clsname + '\InprocServer32', '', Path) then
    begin
      // Successfully read the value
      if Lowercase(ExtractFileName(Path)) = 'mapwingis.ocx' then
			begin
				try
					UnregisterServer(false, Path, false);
#ifdef Debug
					MsgBox('MapWinGIS is unregistered', mbInformation, MB_OK);
#endif
				except
				end;

				if Rename then
				begin
					try
						if not RenameFile(Path, ExtractFilePath(Path) + 'MapWinGIS.ocx.old') then
						begin
							DeleteFile(Path);
						end;
					except
					end;
				end
				else
				begin
					DeleteFile(Path);
				end;
			end;
    end;
  except
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
		Result := MsgBox('Ready to continue MapWindow installation?' #13#13 '(Click Yes after installing .Net Framework ' + versionDotNET + ')', mbConfirmation, MB_YESNO) = idYes;
	end
	else
	begin
		if MsgBox('The .Net Framework ' + versionDotNET + ' is required but was not found.' #13#13 'Open the web page for downloading .Net ' + versionDotNET + ' now?', mbConfirmation, MB_YESNO) = idYes	then
		begin
			ShellExec('open', 'http://www.microsoft.com/downloads/details.aspx?FamilyID=' + urlFamilyID, '', '', SW_SHOW, ewNoWait, ErrorCode)
			Result := MsgBox('Ready to continue MapWindow installation?' #13#13 '(Click Yes after installing .Net Framework ' + versionDotNET + ')', mbConfirmation, MB_YESNO) = idYes;
		end
		else
			Result := MsgBox('.Net ' + versionDotNET + ' Framework is required but was not found.' #13#13 'Continue MapWindow installation?', mbConfirmation, MB_YESNO) = idYes;
	end;
end;

function CheckDotNetVersions(): Boolean;
begin

  // v3.5
  Result := IsDotNET35Detected();
  if not Result then
  begin
    Result := InstallDotNET('v3.5', 'dotnetfx35.exe', 'dotnetfx_v3.5.exe', 'AB99342F-5D1A-413D-8319-81DA479AB0D7');
	end;
end;

function CheckForMWOCX(Rename: Boolean): Boolean;
var
  Names: TArrayOfString;
  I: Integer;
begin
	try
		if RegGetSubkeyNames(HKEY_CLASSES_ROOT, 'CLSID', Names) then
		begin
			for I := 0 to GetArrayLength(Names)-1 do
				UnregisterMapWinGIS(Names[I], Rename);
		end
		else
		begin
			// If user answers no, result is set to false and setup is halted.
			Result := MsgBox('An error has occurred while ensuring that you have no previous versions of MapWinGIS installed.' #13#13 'Please ensure that any old copies are properly uninstalled.' #13#13 'Continue installing anyway?', mbConfirmation, MB_YESNO) = idYes;
		end;
	except
	end;
end;

//Called during Setup's initialization. Return False to abort Setup, True otherwise.
function InitializeSetup(): Boolean;
var
  R1: Boolean;
  NeedToInstallVC: Boolean;
  InstalledSuccesfully: Boolean;
  ResultCode: Integer;
  vcredistFile: string;
begin
  R1 := True;

  // Check for .NET prerequisites
	Result := CheckDotNetVersions();
	if Result then
	begin
		// Check for old MapWinGIS.ocx'es that are registered; unregister them and rename them to .old
		R1 := CheckForMWOCX(true);

		if R1 then
		begin
			// Check for VC++
#ifdef x64BitVersion
			NeedToInstallVC := NeedInstallVC8;
      vcredistFile := 'vcredist_x64_2008.exe';
#else
			NeedToInstallVC := NeedInstallVC8;
      vcredistFile := 'vcredist_x86_2008.exe';
#endif
			if NeedToInstallVC then
			begin
				// Extracts the specified file from the [Files] section to a temporary directory:
				ExtractTemporaryFile(vcredistFile);
				InstalledSuccesfully := Exec(ExpandConstant('{tmp}\' + vcredistFile), '', '', SW_SHOW, ewWaitUntilTerminated, ResultCode);
				if not InstalledSuccesfully then
				begin
					MsgBox(ErrorInstallVC + SysErrorMessage(ResultCode), mbCriticalError, MB_OK);
					// Still need to install so stop installation:
					NeedToInstallVC := true;
				end;
			end
      else
      begin
        // Don't needed to install so set installed is true:
        InstalledSuccesfully := True;
      end;
		end;
	end;

  Result := Result And R1 And InstalledSuccesfully;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
	if CurUninstallStep = usUninstall then
	begin
		// Check for old MapWinGIS.ocx'es that are registered; unregister them. Don't rename the ocx:
		// Because else the OCX stays shared and won't be deleted:
		CheckForMWOCX(false);
	end;
end;
