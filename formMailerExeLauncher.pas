unit formMailerExeLauncher;

interface
{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, SysUtils, CustApp,
  { you can add units after this }
  Interfaces,
  fileutil,
  strutils,
  dialogs,
  IniFiles,
  Process, Unix, baseUnix, strings, StdCtrls;       // mlr

procedure LaunchExe(MemoComponent: TMemo);       // mlr



implementation

const
  READ_BYTES = 2048;

  Arg0 : PChar = '/bin/ls';      // mlr
  Arg1 : Pchar = '-l';           // mlr
var
  OurCommand: String;
  OutputLines: TStringList;
  MemStream: TMemoryStream;
  OurProcess: TProcess;
  i, NumBytes, BytesRead: LongInt;
  sTemp: String;


procedure WritelnStrToList(MemoComponent: TMemo; sLine: string);
var
  sProgressStr: string;
  SenderStringList: TStrings;
begin
  SenderStringList := MemoComponent.Lines;

  SenderStringList.add(sLine);
  MemoComponent.Refresh;

end;
procedure DumpExceptionCallStack(E: Exception; MemoComponent: TMemo); // from Lazarus Wiki tutorial
var
  I: Integer;
  Frames: PPointer;
  Report: string;
begin
  Report := 'Program exception! ' + LineEnding +
    'Stacktrace:' + LineEnding + LineEnding;
  if E <> nil then begin
    Report := Report + 'Exception class: ' + E.ClassName + LineEnding +
    'Message: ' + E.Message + LineEnding;
  end;
  Report := Report + BackTraceStrFunc(ExceptAddr);
  Frames := ExceptFrames;
  for I := 0 to ExceptFrameCount - 1 do
    Report := Report + LineEnding + BackTraceStrFunc(Frames[I]);
  //ShowMessage(Report);  // non-re-entrant, causes exception when called inside a thread
  WritelnStrToList(MemoComponent, Report);
  //Writeln(Report);
  //Halt; // End of program execution or...
  //Terminate  // end TProcess thread
end;

Procedure LaunchExe(MemoComponent: TMemo);
var
  sProgressStr: string;
  SenderStringList: TStrings;
  iExitCode: integer = 0;
begin

  SenderStringList := MemoComponent.Lines;

  // A temp Memorystream is used to buffer the output
  MemStream := TMemoryStream.Create;
  BytesRead := 0;

  OurProcess := TProcess.Create(nil);

  try

    MemoComponent.Refresh;

    // Run this
    //OurProcess.Executable := './Sample.py';

    // or this:
    //OurProcess.Executable := '/usr/local/bin/bash echo $HOME';

    {$DEFINE Windows}
    {$IFDEF UNIX}
    // To send a file to a printer via commandline EXE (UNIX):
    OurProcess.Executable := './bashrun.sh';
    OurProcess.Parameters.Add('lpr');
    //OurProcess.Parameters.Add('/usr/home/mrathbun/KTI/GitHub_Repos/formMailer-1/Saved_TreeViews/TTreeView-1.txt');
    OurProcess.Parameters.Add('/usr/home/mrathbun/KTI/GitHub_Repos/formMailer-1/Sample_PDFs/KTI_Profit_and_Loss_Statement_Jan-Dec_2012.pdf');

    //OurProcess.Parameters.Add('echo');
    //OurProcess.Parameters.Add('$HOME');

    {$ENDIF}
    {$IFDEF Windows}

    // To send a file to a printer via commandline EXE (Windows/DOS):

    // use UNIX console commandline utility "lpstat -s" to see the name and IP address of the printer
    // that must be feed as arguments to Windows' lpr -S and -P parameters.

    // C:\Junk>lpr -S 192.168.000.243 -P Brother-MFC-9320CW  TestBootINI.txt
    // (make sure to DOUBLE quote filenames/paths that have embedded spaces or special characters.)
    // Type lpr /? at the Windows command prompt for help.

//  OurProcess.Executable := 'lpr';
//  OurProcess.Parameters.Add('-S');
//  OurProcess.Parameters.Add('192.168.000.243');
//  OurProcess.Parameters.Add('-P');
//  OurProcess.Parameters.Add('Brother-MFC-9320CW');
//  OurProcess.Parameters.Add('\Junk\TestText-ANSI.txt');

    OurProcess.Executable := 'CMD.EXE';
    OurProcess.Parameters.Add('lpr');
    OurProcess.Parameters.Add('-S');
    OurProcess.Parameters.Add('192.168.000.243');
    OurProcess.Parameters.Add('-P');
    OurProcess.Parameters.Add('Brother-MFC-9320CW');
    OurProcess.Parameters.Add('\Junk\TestText-ANSI.txt');

    {$ENDIF}



    OurProcess.Parameters.Delimiter := ' ';
    WritelnStrToList(MemoComponent, 'External Program To Run: ' + OurProcess.Executable
  //      + ' ' + DelChars(OurProcess.Parameters.Text, #10));
       + ' ' + OurProcess.Parameters.DelimitedText);

    // We cannot use poWaitOnExit here since we don't
    // know the size of the output. On Linux the size of the
    // output pipe is 2 kB; if the output data is more, we
    // need to read the data. This isn't possible since we are
    // waiting. So we get a deadlock here if we use poWaitOnExit.
    OurProcess.Options := [poUsePipes];

    WritelnStrToList(MemoComponent, 'Program Started -');

    Try
     OurProcess.Execute;
    except
      on E: Eprocess do
      begin
        DumpExceptionCallStack(E, MemoComponent);  // shows source code line number where exception was raised.
      end;
      on E: Exception do
      begin
        DumpExceptionCallStack(E, MemoComponent);  // shows source code line number where exception was raised.
      end;
      else
      begin
        raise;
      end;
    end;

    iExitCode := OurProcess.ExitStatus;

    WritelnStrToList(MemoComponent, '');
    sProgressStr := 'Running';

    while True do
    begin
      // make sure we have room
      MemStream.SetSize(BytesRead + READ_BYTES);

      // try reading it
      NumBytes := OurProcess.Output.Read((MemStream.Memory + BytesRead)^, READ_BYTES);

      if NumBytes > 0 // All read() calls will block, except the final one.
      then
      begin
        Inc(BytesRead, NumBytes);
        AppendStr(sProgressStr, '.');
        // Use the following rather than WritelnStrToList(MemoComponent, ...)
        // because this does a "Write()" rather than a "Writeln()" to the
        // string list.
        SenderStringList.Strings[SenderStringList.Count-1] := sProgressStr;
        MemoComponent.Refresh;
      end
      else
        BREAK // Program has finished execution.
    end;

    MemStream.SetSize(BytesRead);
    WritelnStrToList(MemoComponent, 'Program Completed.');

    WritelnStrToList(MemoComponent, 'TProcess.Execute''s Exit Code: '+ IntToStr(iExitCode));

    OutputLines := TStringList.Create;
    OutputLines.LoadFromStream(MemStream);

    WritelnStrToList(MemoComponent, 'Program Output Line Count = ''' + IntToStr(OutputLines.Count) +'''' );
    WritelnStrToList(MemoComponent, '-- Output Dump --');

    for NumBytes := 0 to OutputLines.Count - 1 do
    begin
      WritelnStrToList(MemoComponent,'Line '+ IntToStr(NumBytes) + ':');
      WritelnStrToList(MemoComponent,OutputLines[NumBytes]);
    end;
    WritelnStrToList(MemoComponent, '-- End Of Output --');

  finally
    OutputLines.Free;
    OurProcess.Free;
    MemStream.Free;
  end;
end;

Initialization
begin


end;
Finalization
begin

end;
end.

