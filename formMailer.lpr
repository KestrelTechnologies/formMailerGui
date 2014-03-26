program formMailer;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Sysutils, Forms, formMailerUnit1, formMailerExeLauncher, dialogs,
  virtualtreeview_package, printer4lazarus, IniFiles;

{$R *.res}

procedure SetupIniFileObject;
var
  sTemp: string;
begin

  // Create the IniFile Object to be used throughout this application

  {$IFDEF Windows}
    // Look for the INI file in the EXE's launch folder
    // by specifying the current folder with ".\"

    gsIniFileName := '.\DHUNTFM.cfg';
  {$ENDIF Windows}
  {$IFDEF Unix}
    // Because under Unix the home of the binary (i.e. EXE) file
    // might be in a directory that has write permissions forbidden,
    // the INI file must be found or created in the user's home folder
    // (specified with ~/) where write permissions allow it. The file name is
    // also prefixed with a dot so that it will be a "hidden" file.

    gsIniFileName := Application.EnvironmentVariable['HOME'];

     if gsIniFileName <> '' then
       gsIniFileName := gsIniFileName + '/.DHUNTFM.ini'
     else
       raise Exception.Create('Error creating TIniFile object.');
  {$ENDIF Unix}

    // Instanciating an TIniFile object with cause the INI file to be created
    // if it doesn't already exist.
    goIniFile := TIniFile.Create(gsIniFileName);
    goIniFile.CacheUpdates := False;
    //sTemp := goIniFile.ReadString('D.Hunt General','RetrievalURL','http://mycase.in.gov');
    //goIniFile.WriteString('General','RetrievalURL',sTemp);

end;
Procedure DestroyIniFileObject;
begin
   if goIniFile <> nil then
   begin
     goIniFile.UpdateFile;
     goIniFile.Destroy;
   end;
end;
begin
  try
    RequireDerivedFormResource := True;
    Application.Initialize;
    SetupIniFileObject;
    Application.CreateForm(TForm1, Form1);
    Application.ShowMainForm := False;   // so app only shows up as TaskIcon
    Application.Run;
  finally
    DestroyIniFileObject;
  end;
end.

