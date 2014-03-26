unit formMailerUnit1;

//{$mode objfpc}{$H+}
{$MODE DELPHI}            // mlr - necessary for Virtual TreeView

interface

uses
  Classes, SysUtils, FileUtil, SynMemo, SynEdit, Forms, Controls, Graphics,
  ComCtrls, ExtCtrls, Menus, StdCtrls, Calendar, EditBtn, PopupNotifier,
  ButtonPanel, Buttons, MaskEdit, Spin, CheckLst, formMailerExeLauncher,
  IniFiles, DateUtils, VirtualTrees, PrintersDlgs, Printers;

type

  { TForm1 }

  TForm1 = class(TForm)
    ActivityMemo1: TMemo;
    ActivityMemo2: TMemo;
    ApplicationProperties1: TApplicationProperties;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    PrinterSetupSpeedButton6: TSpeedButton;
    CaseIDBuilderMenuItem1: TMenuItem;
    CaseIDSearchStringLabel6: TLabel;
    CaseIDSearchStringLabel7: TLabel;
    CaseIDSearchStrMaskEdit1: TMaskEdit;
    CaseIDMonthSpinEdit2: TSpinEdit;
    CaseTypesComboBox3: TComboBox;
    CheckBox1: TCheckBox;
    FileNameEdit1: TFileNameEdit;
    Label9: TLabel;
    PageSetupDialog1: TPageSetupDialog;
    Panel11: TPanel;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    PrintDialogSpeedButton7: TSpeedButton;
    PageSetupSpeedButton8: TSpeedButton;
    PrintSpeedButton8: TSpeedButton;
    RetrievalURLCheckBox1: TCheckBox;
    DirectoryEdit3: TDirectoryEdit;
    FormLetterFileNameLabel6: TLabel;
    FormLetterFileNameLabel7: TLabel;
    FormLetterFileNameLabel8: TLabel;
    GroupBox3: TGroupBox;
    InstantRunCaseIDComboBox3: TComboBox;
    MenuItem1: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem9: TMenuItem;
    OpenTemplateLetterButton1: TButton;
    CaseIDCaseSequenceComboBox: TComboBox;
    CaseIDformatLabel1: TLabel;
    CaseIDCountyNumComboBox: TComboBox;
    CaseIDCountyCourtIDComboBox: TComboBox;
    CaseIDCourtTypeCodeComboBox: TComboBox;
    CaseIDCaseTypeComboBox: TComboBox;
    CourtLocationsComboBox1: TComboBox;
    CaseTypesComboBox2: TComboBox;
    CaseIDSearchStrComboBox2: TComboBox;
    DirectoryEdit1: TDirectoryEdit;
    DirectoryEdit2: TDirectoryEdit;
    FormLetterFileNameLabel1: TLabel;
    FormLetterFileNameLabel2: TLabel;
    FormLetterFileNameLabel3: TLabel;
    FormLetterFileNameLabel4: TLabel;
    FormLetterFileNameLabel5: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    CaseIDPanel5: TPanel;
    CaseIDSearchStrLabel2: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    AutoRunTabSheet: TTabSheet;
    FormLetterTabSheet: TTabSheet;
    Label8: TLabel;
    InstantRunCaseIDComboBox2: TComboBox;
    CaseIDYearSpinEdit1: TSpinEdit;
    PageControl2: TPageControl;
    Panel10: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    QuitSpeedButton3: TSpeedButton;
    JobStateEnabledRadioButton1: TRadioButton;
    JobStateDisabledRadioButton2: TRadioButton;
    RetreivalSettingsTabSheet1: TTabSheet;
    CaseIDBuilderTabSheet2: TTabSheet;
    TypeOfCasesCheckBox2: TCheckBox;
    RetrievalURLCheckBox3: TCheckBox;
    CaseIDCheckBox4: TCheckBox;
    FormLetterCheckBox5: TCheckBox;
    MergedOutputFolderCheckBox6: TCheckBox;
    RetrievalURLComboBox2: TComboBox;
    RunLabel4: TLabel;
    RunLabel5: TLabel;
    RunLabel6: TLabel;
    RunSettingsTabSheet1: TTabSheet;
    RunSpeedButton3: TSpeedButton;
    RunStatusTabSheet1: TTabSheet;
    RetrievalJobsTabSheet1: TTabSheet;
    SetTimerLabel5: TLabel;
    Splitter3: TSplitter;
    RunSettingsTabSheet3: TTabSheet;
    RunLogTabSheet2: TTabSheet;
    Splitter4: TSplitter;
    StopSpeedButton2: TSpeedButton;
    TemplateLetterFileNameEdit2: TFileNameEdit;
    TemplateLetterFileNameEdit3: TFileNameEdit;
    TimerSpeedButton4: TSpeedButton;
    CaseIDBuilderSpeedButton5: TSpeedButton;
    TVJobMenu2: TPopupMenu;
    TrayIconShutDown1: TMenuItem;
    TreeView2: TTreeView;
    TypeOfCasesLabel1: TLabel;
    SelectLocationLabel1: TLabel;
    TrayIconShutDown: TMenuItem;
    TrayIconMinimize: TMenuItem;
    TrayIconDisplay: TMenuItem;
    MenuItem2: TMenuItem;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    TrayIconPopupMenu1: TPopupMenu;
    PopupNotifier1: TPopupNotifier;
    MainMenu1: TMainMenu;
    InstantRunTabSheet: TTabSheet;
    QuitSpeedButton2: TSpeedButton;
    RetrievalURLComboBox1: TComboBox;
    RunLabel1: TLabel;
    RunLabel2: TLabel;
    RunLabel3: TLabel;
    RunSpeedButton2: TSpeedButton;
    SetTimerLabel4: TLabel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StopSpeedButton1: TSpeedButton;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItemFile: TMenuItem;
    StatusBar1: TStatusBar;
    CaseIDTabSheet: TTabSheet;
    TemplateLetterFileNameEdit1: TFileNameEdit;
    TimerSpeedButton3: TSpeedButton;
    TrayIcon1: TTrayIcon;
    TypeOfCasesLabel2: TLabel;
    VST: TVirtualStringTree;
    procedure ApplicationProperties1Minimize(Sender: TObject);
    procedure ApplicationProperties1Restore(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CaseIDBuilderSpeedButton5Click(Sender: TObject);
    procedure CaseIDCaseSequenceComboBoxChange(Sender: TObject);
    procedure CaseIDCaseTypeComboBoxChange(Sender: TObject);
    procedure CaseIDCountyCourtIDComboBoxChange(Sender: TObject);
    procedure CaseIDCountyNumComboBoxChange(Sender: TObject);
    procedure CaseIDCourtTypeCodeComboBoxChange(Sender: TObject);
    procedure CaseIDCourtTypeCodeComboBoxEditingDone(Sender: TObject);
    procedure CaseIDformatLabel1Click(Sender: TObject);
    procedure CaseIDMonthSpinEdit2Change(Sender: TObject);
    procedure CaseIDYearSpinEdit1Change(Sender: TObject);
    procedure DirectoryEdit1Change(Sender: TObject);
    procedure DirectoryEdit1Exit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItemFileClick(Sender: TObject);
    procedure OpenTemplateLetterButton1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PageSetupSpeedButton8Click(Sender: TObject);
    procedure PrinterSetupSpeedButton6Click(Sender: TObject);
    procedure PrintDialogSpeedButton7Click(Sender: TObject);
    procedure PrintSpeedButton8Click(Sender: TObject);
    procedure QuitSpeedButton2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RetrievalURLComboBox1Change(Sender: TObject);
    procedure RunRadioButton1Click(Sender: TObject);
    procedure StopSpeedButton1Click(Sender: TObject);
    procedure RunSpeedButton2Click(Sender: TObject);
    procedure StopRadioButton2Change(Sender: TObject);
    procedure TemplateLetterFileNameEdit1Change(Sender: TObject);
    procedure TemplateLetterFileNameEdit1Exit(Sender: TObject);
    procedure TimerSpeedButton3Click(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure TrayIconMinimizeClick(Sender: TObject);
    procedure TrayIconDisplayClick(Sender: TObject);
    procedure TrayIconShutDownClick(Sender: TObject);
    procedure VSTChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex);
    procedure VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure VSTGetNodeDataSize(Sender: TBaseVirtualTree;
      var NodeDataSize: Integer);
    procedure VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
    procedure VSTNewText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; const NewText: String);
  private
    { private declarations }

  public
    { public declarations }
  end;

var
  Form1: TForm1;

  // and also for use application-wide:
  gsIniFileName: string;
  goIniFile: TIniFile;

implementation

uses lclintf, dialogs;

{$R *.lfm}

{ TForm1 }

type
  PTreeData = ^TTreeData;
  TTreeData = record
    Column0: String;
    Column1: String;
    Column2: String;
  end;

var  boolRunRequirementsMet: Boolean;

function CheckRunRequirements: Boolean;
begin
  Result := False;
  if (Form1.DirectoryEdit1.Directory <> '')
      and (Form1.TemplateLetterFileNameEdit1.FileName <> '')
      and (Form1.RetrievalURLComboBox1.Text <> '')
  then
    Result := True;

  Form1.RunSpeedButton2.Enabled := Result;

  if Result then
    Form1.RunLabel1.Caption := 'Ready to process'
  else
    Form1.RunLabel1.Caption := 'Not ready to process'
end;
procedure BuildCaseIDSearchString;
Var
  sFormatedCaseID, sCourtID, sCaseYear, sCaseType : AnsiString;
  iPos: integer;
begin
  with Form1 do
  begin
  //ShowMessage('CaseIDSearchStrComboBox2.Text = ''' + CaseIDSearchStrComboBox2.Text + '''');

  {    ShowMessage('CaseIDCountyCourtIDComboBox.ItemIndex = '''
                + IntToStr(CaseIDCountyCourtIDComboBox.ItemIndex)
                + ''''+ #13#10
                + 'CaseIDCountyCourtIDComboBox.Text = '''
                + CaseIDCountyCourtIDComboBox.Text
                + ''''+ #13#10
                + 'CaseIDCaseTypeComboBox.ItemIndex = '''
                + IntToStr(CaseIDCaseTypeComboBox.ItemIndex)
                + ''''+ #13#10
                + 'CaseIDCaseTypeComboBox.Text = '''
                + CaseIDCaseTypeComboBox.Text
                + ''''+ #13#10
                + 'CaseIDCaseSequenceComboBox.ItemIndex = '''
                + IntToStr(CaseIDCaseSequenceComboBox.ItemIndex)
                + ''''+ #13#10
                + 'CaseIDCaseSequenceComboBox.Text = '''
                + CaseIDCaseSequenceComboBox.Text
                + ''''

                );
   }
  if ((CaseIDCountyCourtIDComboBox.ItemIndex <> -1)
     or ((CaseIDCountyCourtIDComboBox.Text <> '') and (CaseIDCountyCourtIDComboBox.Text <> ' ')))
  and ((CaseIDCaseTypeComboBox.ItemIndex <> -1)
     or ((CaseIDCaseTypeComboBox.Text <> '') and (CaseIDCaseTypeComboBox.Text <> ' ')))
  and ((CaseIDCaseSequenceComboBox.ItemIndex <> -1)
     or ((CaseIDCaseSequenceComboBox.Text <> '') and (CaseIDCaseSequenceComboBox.Text <> ' ')))
  then
  begin
    sFormatedCaseID := '';

    // change YYYY to YY
    sCaseYear := Format('%.4d',[CaseIDYearSpinEdit1.Value]);
    Delete(sCaseYear,1,2);

    // strip verbage leaving only county and court code
    sCourtID := CaseIDCountyCourtIDComboBox.Text;
    Delete(sCourtID,1,Pos('=',sCourtID));

    // strip verbage from case type, leaving only 2 char case type code
    sCaseType := CaseIDCaseTypeComboBox.Text;
    iPos := Pos('=',sCaseType);
    Delete(sCaseType,iPos, Length(sCaseType){ - iPos});



    FmtStr(sFormatedCaseID,'%s-%s%s-%s-%s',
      [sCourtID,
      sCaseYear,
      Format('%.2d',[CaseIDMonthSpinEdit2.Value]),  // format so leading zeros show in numeric month
      //IntToStr(CaseIDMonthSpinEdit2.Value),
      sCaseType,
      CaseIDCaseSequenceComboBox.Text]);

    CaseIDSearchStrComboBox2.Text := UpperCase(sFormatedCaseID);
    CaseIDSearchStrMaskEdit1.Text := UpperCase(sFormatedCaseID);

  end
  else
  begin
  {
    ShowMessage('CaseIDCountyCourtIDComboBox.ItemIndex = '''
                + IntToStr(CaseIDCountyCourtIDComboBox.ItemIndex)
                + ''''+ #13#10
                + 'CaseIDCountyCourtIDComboBox.Text = '''
                + CaseIDCountyCourtIDComboBox.Text
                + ''''+ #13#10
                + 'CaseIDCaseTypeComboBox.ItemIndex = '''
                + IntToStr(CaseIDCaseTypeComboBox.ItemIndex)
                + ''''+ #13#10
                + 'CaseIDCaseTypeComboBox.Text = '''
                + CaseIDCaseTypeComboBox.Text
                + ''''+ #13#10
                + 'CaseIDCaseSequenceComboBox.ItemIndex = '''
                + IntToStr(CaseIDCaseSequenceComboBox.ItemIndex)
                + ''''+ #13#10
                + 'CaseIDCaseSequenceComboBox.Text = '''
                + CaseIDCaseSequenceComboBox.Text
                + ''''

                );
    }
  end;

  end;
end;

procedure TForm1.MenuItemFileClick(Sender: TObject);
begin

end;

procedure TForm1.OpenTemplateLetterButton1Click(Sender: TObject);
begin
  if OpenDocument(TemplateLetterFileNameEdit2.FileName) then
    ShowMessage('Opening template letter')
  else
    ShowMessage('Not opening template letter.');
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  // Quit menu item
  Application.Terminate;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  Caption := 'D.Hunt Form Mailer';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ShowInTaskBar := stNever;
  PageControl1.ActivePage := InstantRunTabSheet;
  RetrievalURLComboBox1.Items.Add(
  goIniFile.ReadString('D.Hunt General','RetrievalURL','http://mycase.in.gov'));


  InstantRunCaseIDComboBox2.Items.Add(
  goIniFile.ReadString('D.Hunt General','Instant Run Case ID','22C01-1301-IF-*'));


  goIniFile.ReadSectionValues('mycase.in.gov Court Locations',CourtLocationsComboBox1.Items);
  goIniFile.ReadSectionValues('mycase.in.gov Case Types',CaseTypesComboBox2.Items);
  goIniFile.ReadSectionValues('mycase.in.gov Case Types',CaseTypesComboBox3.Items);

  goIniFile.ReadSectionValues('County Names-Codes',CaseIDCountyNumComboBox.Items);
  goIniFile.ReadSectionValues('Indiana Court Type Codes',CaseIDCourtTypeCodeComboBox.Items);

  goIniFile.ReadSectionValues('County Courts-Names-Codes',CaseIDCountyCourtIDComboBox.Items);

  {
  CaseIDYearComboBox.Items.Add(
    goIniFile.ReadString('D.Hunt General','Court Case Year','13'));

  CaseIDYearComboBox.Items.Add();
  }

  CaseIDYearSpinEdit1.Value := StrToInt(FormatDateTime('YYYY',Now));
  CaseIDMonthSpinEdit2.Value := StrToInt(FormatDateTime('MM',Now));

  {
  CaseIDMonthComboBox.Items.Add(
    goIniFile.ReadString('D.Hunt General','Court Case Month','01'));
  }
  goIniFile.ReadSectionValues('Court Case Type Code-Name',CaseIDCaseTypeComboBox.Items);

  CaseIDCaseSequenceComboBox.Items.Add(
    goIniFile.ReadString('D.Hunt General','Court Case Sequence Number','*'));


end;

procedure TForm1.FormWindowStateChange(Sender: TObject);
begin

end;

procedure TForm1.GroupBox2Click(Sender: TObject);
begin

end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
Var
  Data: PTreeData;
  XNode: PVirtualNode;
  Rand: Integer;
Begin
  Randomize;
  Rand := Random(99);
  XNode:=VST.AddChild(nil);

  if VST.AbsoluteIndex(XNode) > -1 then
  Begin
   Data := VST.GetNodeData(Xnode);
   Data^.Column0:= 'One ' + IntToStr(Rand);
   Data^.Column1:= 'Two ' + IntToStr(Rand + 10);
   Data^.Column2:= 'Three ' + IntToStr(Rand - 10);
  End;
End;

procedure TForm1.Button2Click(Sender: TObject);
var
  XNode: PVirtualNode;
  Data: PTreeData;
begin
  if not Assigned(VST.FocusedNode) then
    Exit;

    XNode := VST.AddChild(VST.FocusedNode);
    Data := VST.GetNodeData(Xnode);

    Data^.Column0:= 'Ch 1';
    Data^.Column1:= 'Ch 2';
    Data^.Column2:= 'Ch 3';

   VST.Expanded[VST.FocusedNode]:=True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  VST.DeleteSelectedNodes;
end;

procedure TForm1.CaseIDBuilderSpeedButton5Click(Sender: TObject);
begin
  ShowMessage('This will open the Case ID Builder'+#13#10+'which will assist in building'
              +#13#10+'a proper Case ID string.');
end;

procedure TForm1.CaseIDCaseSequenceComboBoxChange(Sender: TObject);
begin
   BuildCaseIDSearchString;
end;

procedure TForm1.CaseIDCaseTypeComboBoxChange(Sender: TObject);
begin
    BuildCaseIDSearchString;
end;

procedure TForm1.CaseIDCountyCourtIDComboBoxChange(Sender: TObject);
begin
    BuildCaseIDSearchString;
end;

procedure TForm1.CaseIDCountyNumComboBoxChange(Sender: TObject);
begin

end;

procedure TForm1.CaseIDCourtTypeCodeComboBoxChange(Sender: TObject);
begin
    BuildCaseIDSearchString;
end;

procedure TForm1.CaseIDCourtTypeCodeComboBoxEditingDone(Sender: TObject);
begin

end;

procedure TForm1.CaseIDformatLabel1Click(Sender: TObject);
begin

end;

procedure TForm1.CaseIDMonthSpinEdit2Change(Sender: TObject);
begin
    BuildCaseIDSearchString;
end;

procedure TForm1.CaseIDYearSpinEdit1Change(Sender: TObject);
begin
    BuildCaseIDSearchString;
end;

procedure TForm1.ApplicationProperties1Minimize(Sender: TObject);
begin

end;

procedure TForm1.ApplicationProperties1Restore(Sender: TObject);
begin

end;

procedure TForm1.DirectoryEdit1Change(Sender: TObject);
begin
  boolRunRequirementsMet := CheckRunRequirements;
end;

procedure TForm1.DirectoryEdit1Exit(Sender: TObject);
begin

end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin

end;

procedure TForm1.PageSetupSpeedButton8Click(Sender: TObject);
begin
  PageSetupDialog1.Execute;
end;

procedure TForm1.PrinterSetupSpeedButton6Click(Sender: TObject);
begin
  PrinterSetupDialog1.Execute;
end;

procedure TForm1.PrintDialogSpeedButton7Click(Sender: TObject);
begin
  PrintDialog1.Execute;
end;

procedure TForm1.PrintSpeedButton8Click(Sender: TObject);
const
  LEFTMARGIN = 100;
  HEADLINE = 'I Printed My Very First Text On ';
var
  YPos, LineHeight, VerticalMargin: Integer;
  SuccessString: String;
begin
  with Printer do
  try
    BeginDoc;
    Filename := '/usr/home/mrathbun/KTI/GitHub_Repos/formMailer-1/Saved TreeViews/TTreeView-2.txt';
    Canvas.Font.Name := 'Courier New';
    Canvas.Font.Size := 10;
    Canvas.Font.Color := clBlack;
    LineHeight := Round(1.2 * Abs(Canvas.TextHeight('I')));
    VerticalMargin := 4 * LineHeight;
    // There we go
    {
    YPos := VerticalMargin;
    SuccessString := HEADLINE + DateTimeToStr(Now);
    Canvas.TextOut(LEFTMARGIN, YPos, SuccessString);
    }
  finally
    EndDoc;
  end;
end;

procedure TForm1.QuitSpeedButton2Click(Sender: TObject);
begin
  RunLabel1.Caption := 'Ready to Process';
  Caption := 'D.Hunt Form Mailer - Shutting Down...';
  RunLabel2.Caption := 'Processing Stopped';
  Application.Terminate;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin

end;

procedure TForm1.RetrievalURLComboBox1Change(Sender: TObject);
begin
    boolRunRequirementsMet := CheckRunRequirements;
end;

procedure TForm1.RunRadioButton1Click(Sender: TObject);
begin

end;

procedure TForm1.StopSpeedButton1Click(Sender: TObject);
begin
  RunLabel1.Caption := 'Ready to Process';
  Caption := 'D.Hunt Form Mailer - Ready';
  RunLabel2.Caption := 'Processing Stopped';

end;

procedure TForm1.RunSpeedButton2Click(Sender: TObject);
begin
  StopSpeedButton1.Down := False;
  RunLabel1.Caption := 'Running Process...';
  Caption := 'D.Hunt Form Mailer - Running...';
  RunLabel2.Caption := '  ';

  ActivityMemo1.Lines.Clear;
  formMailerExeLauncher.LaunchExe(ActivityMemo1);
  StopSpeedButton1.Down := True;
  StopSpeedButton1Click(Self);

end;

procedure TForm1.StopRadioButton2Change(Sender: TObject);
begin

end;

procedure TForm1.TemplateLetterFileNameEdit1Change(Sender: TObject);
begin
  boolRunRequirementsMet := CheckRunRequirements;
end;

procedure TForm1.TemplateLetterFileNameEdit1Exit(Sender: TObject);
begin

end;

procedure TForm1.TimerSpeedButton3Click(Sender: TObject);
begin

end;

procedure TForm1.TrayIcon1DblClick(Sender: TObject);
begin
  if Form1.Visible then
  begin
    Form1.Visible := False;
  end
  else
    Form1.Show;
end;

procedure TForm1.TrayIconMinimizeClick(Sender: TObject);
begin
  Form1.Visible := False;
end;

procedure TForm1.TrayIconDisplayClick(Sender: TObject);
begin
  Form1.Show;
end;

procedure TForm1.TrayIconShutDownClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.VSTChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  VST.Refresh;
end;

procedure TForm1.VSTFocusChanged(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex);
begin
  VST.Refresh;
end;

procedure TForm1.VSTFreeNode(Sender: TBaseVirtualTree; Node: PVirtualNode);
var
  Data: PTreeData;
begin
  Data:=VST.GetNodeData(Node);
  if Assigned(Data) then begin
    Data^.Column0 := '';
    Data^.Column1 := '';
    Data^.Column2 := '';
  end;
end;

procedure TForm1.VSTGetNodeDataSize(Sender: TBaseVirtualTree;
  var NodeDataSize: Integer);
begin
  NodeDataSize := SizeOf(TTreeData);
end;

procedure TForm1.VSTGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; TextType: TVSTTextType; var CellText: String);
var
  Data: PTreeData;
begin
  Data := VST.GetNodeData(Node);
  case Column of
    0: CellText := Data^.Column0;
    1: CellText := Data^.Column1;
    2: CellText := Data^.Column2;
  end;
end;

procedure TForm1.VSTNewText(Sender: TBaseVirtualTree; Node: PVirtualNode;
  Column: TColumnIndex; const NewText: String);
Var
  Data: PTreeData;
begin
  Data := VST.GetNodeData(Node);
  Case Column of
    0: Data^.Column0:= NewText;
    1: Data^.Column1:= NewText;
    2: Data^.Column2:= NewText;
  End;
end;

end.

