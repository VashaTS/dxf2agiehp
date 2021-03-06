unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls,inifiles, ShlObj, Registry, DateUtils, Unit10;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckGroup1: TCheckGroup;
    ComboBox1: TComboBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit10: TLabeledEdit;
    LabeledEdit11: TLabeledEdit;
    LabeledEdit12: TLabeledEdit;
    LabeledEdit13: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    LabeledEdit15: TLabeledEdit;
    LabeledEdit16: TLabeledEdit;
    LabeledEdit17: TLabeledEdit;
    LabeledEdit18: TLabeledEdit;
    LabeledEdit19: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit20: TLabeledEdit;
    LabeledEdit21: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    LabeledEdit9: TLabeledEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SelectDirectoryDialog2: TSelectDirectoryDialog;
    SelectDirectoryDialog3: TSelectDirectoryDialog;
    SelectDirectoryDialog4: TSelectDirectoryDialog;
    SelectDirectoryDialog5: TSelectDirectoryDialog;
    SelectDirectoryDialog6: TSelectDirectoryDialog;
    SelectDirectoryDialog7: TSelectDirectoryDialog;
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure LabeledEdit12Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

procedure logToFile(inp,typ:string);
var lf:TextFile;
  fd:string;
begin
   DateTimeToString(fd,'yyyy-mm-dd hh:nn:ss',Now);
   AssignFile(lf,Application.Location+'\logfile'+inttostr(YearOf(Now))+'.log');
   if (fileexists(Application.Location+'\logfile'+inttostr(YearOf(Now))+'.log')=false) then begin
     rewrite(lf);
     writeln(lf,fd+' Log started');
     end
   else Append(lf);
   writeln(lf,fd+' '+typ+' '+inp);
   CloseFile(lf);
end;

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
var ust:TIniFile;
begin
   ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   ust.WriteString('settings','defaultNoOfRows',LabeledEdit1.Text);
   ust.WriteString('settings','defaultElectrodeMaterial',LabeledEdit2.Text);
   ust.WriteString('settings','defaultPieceMaterial',inttostr(ComboBox1.ItemIndex));
   ust.WriteString('settings','pathDXF',LabeledEdit4.Text);
   ust.WriteString('settings','pathMES',LabeledEdit5.Text);
   ust.WriteString('settings','pathOutput',LabeledEdit6.Text);
   ust.WriteString('settings','maxPositionInMagazine',LabeledEdit7.Text);
   ust.WriteString('settings','defaultSideOffset',LabeledEdit8.Text);
   ust.WriteString('settings','pp',LabeledEdit9.Text);
   ust.WriteString('settings','defaultZOffset',LabeledEdit10.Text);
   ust.WriteString('settings','pathVDM',LabeledEdit11.Text);
   ust.WriteString('settings','pathCSV',LabeledEdit3.Text);
   ust.WriteString('settings','pathCSVexport',LabeledEdit13.Text);
   ust.WriteString('settings','minPositionInMagazine',LabeledEdit12.Text);
   ust.WriteSTring('settings','GCn1x',LabeledEdit14.Text);
   ust.WriteSTring('settings','GCn1y',LabeledEdit15.Text);
   ust.WriteSTring('settings','GCn2x',LabeledEdit16.Text);
   ust.WriteSTring('settings','GCn2y',LabeledEdit17.Text);
   ust.WriteString('settings','GCLineLength',LabeledEdit18.Text);
   ust.WriteString('settings','lang',LabeledEdit19.Text);
   if RadioButton1.Checked=True then ust.WriteString('settings','electrodeStrategy','1')
   else if RadioButton2.Checked=True then ust.WriteString('settings','electrodeStrategy','2')
   else if RadioButton3.Checked=True then ust.WriteString('settings','electrodeStrategy','3');
   if RadioButton4.Checked=True then ust.WriteString('settings','tabOrderF2','stary')
   else if RadioButton5.Checked=True then ust.WriteString('settings','tabOrderF2','nowy');
   if RadioButton6.Checked=True then ust.WriteString('settings','f2_ellist','magpos')
   else if RadioButton7.Checked=True then ust.WriteString('settings','f2_ellist','number');
   if CheckBox1.Checked then ust.WriteString('settings','createFolder','1')
   else ust.WriteString('settings','createFolder','0');
   if CheckBox2.Checked then ust.WriteString('settings','naPen','1')
   else ust.WriteString('settings','naPen','0');
   if CheckBox3.Checked then ust.WriteString('settings','exportAgieHP','1')
   else ust.WriteString('settings','exportAgieHP','0');
   if CheckBox4.Checked then ust.WriteString('settings','exportX400','1')
   else ust.WriteString('settings','exportX400','0');
   if CheckBox5.Checked then ust.WriteString('settings','exportCERTA','1')
   else ust.WriteString('settings','exportCERTA','0');
   if CheckBox6.Checked then ust.WriteString('settings','precalculatedElectrodeData','1')
   else ust.WriteString('settings','precalculatedElectrodeData','0');
   if CheckBox7.Checked then ust.WriteString('settings','moreInterlines','1')
   else ust.WriteString('settings','moreInterlines','0');
   if CheckBox8.Checked then ust.WriteString('settings','GCDrawWorkpiece','1')
   else ust.WriteString('settings','GCDrawWorkPiece','0');
   if CheckBox9.Checked then ust.WriteString('settings','allowZeroUndersize','1')
   else ust.WriteString('settings','allowZeroUndersize','0');
   ust.WriteString('settings','verboseMode',LabeledEdit20.Text);
   ust.WriteString('settings','pathXMLJ',LabeledEdit21.Text);
   ust.Free;
   logToFile('settings saved','INF');
   Form3.Close;
end;

procedure TForm3.Button10Click(Sender: TObject);
begin
  if SelectDirectoryDialog5.Execute then begin
    LabeledEdit3.Text:=SelectDirectoryDialog5.FileName;
    logToFile('Changed CSV Import folder','INF');
  end;
end;

procedure TForm3.Button11Click(Sender: TObject);
begin
  if SelectDirectoryDialog6.Execute then begin
    LabeledEdit13.Text:=SelectDirectoryDialog6.FileName;
    logToFile('Changed CSV Export folder','INF');
  end;
end;

procedure TForm3.Button12Click(Sender: TObject);
begin
  if SelectDirectoryDialog7.Execute then begin
    LabeledEdit21.Text:=SelectDirectoryDialog7.FileName;
    logToFile('Changed XMLJ folder','INF');
  end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  if SelectDirectoryDialog1.Execute then begin
    LabeledEdit4.Text:=SelectDirectoryDialog1.FileName;
    logToFile('Changed DXF folder','INF');
  end;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  if SelectDirectoryDialog2.Execute then begin
    LabeledEdit5.Text:=SelectDirectoryDialog2.FileName;
    logToFile('Changed MES folder','INF');
  end;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  if SelectDirectoryDialog3.Execute then begin
    LabeledEdit6.Text:=SelectDirectoryDialog3.FileName;
    logToFile('Changed AgieVision Export folder','INF');
  end;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  with TRegistry.Create do
    try
      RootKey:=HKEY_CURRENT_USER;
      if OpenKey('\Software\Classes\.edf', true) then WriteString('','EdfFile');
      if OpenKey('\Software\Classes\EdfFile', true) then WriteString('','EDF File');
      if OpenKey('\Software\Classes\EdfFile\DefaultIcon', true) then WriteString('',Application.Location+'edf.ico');
      if OpenKey('\Software\Classes\EdfFile\shell\open\command', true) then WriteString('',Application.ExeName+' "%1"');
     // RootKey:=HKEY_CLASSES_ROOT;
     // if OpenKey('\Applications\dxf2agiehp.exe\shell\open', true) then WriteString('FriendlyAppName','DXF 2 AGIE HP');
    finally
      Free;
    end;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  logToFile('Attempted adding EDF file to registry','INF');
end;

procedure TForm3.Button7Click(Sender: TObject);
begin
  with TRegistry.Create do
    try
      RootKey:=HKEY_CURRENT_USER;
      if OpenKey('\Software\Classes\.mi', true) then WriteString('','MI_FILE');
      if OpenKey('\Software\Classes\MI_FILE', true) then WriteString('','MI File');
      //if OpenKey('\Software\Classes\Dxf2AgiehpFile\DefaultIcon', true) then WriteString('',Application.Location+'icon_file.ico');
      if OpenKey('\Software\Classes\MI_FILE\shell\open\command', true) then WriteString('',Application.ExeName+' "%1"');
    finally
      Free;
    end;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
  logToFile('Attempted adding MI file to registry','INF');
end;

procedure TForm3.Button8Click(Sender: TObject);
begin
  if SelectDirectoryDialog4.Execute then begin
    LabeledEdit11.Text:=SelectDirectoryDialog4.FileName;
    logToFile('Changed EDF folder','INF');
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
var ust:TIniFile;
rad,fold,nap,agiehp,x400,certa,tabf2,calcEle,interlines,drawpiece,zerous,lang:string;
begin
   ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   LabeledEdit1.Text:=ust.ReadString('settings','defaultNoOfRows','10');
   LabeledEdit2.Text:=ust.ReadString('settings','defaultElectrodeMaterial','Graphite2');
   ComboBox1.ItemIndex:=strtoint(ust.ReadString('settings','defaultPieceMaterial','0'));
   LabeledEdit4.Text:=ust.ReadString('settings','pathDXF','C:\Intel\LazarusPortable\dxf test');
   LabeledEdit5.Text:=ust.ReadString('settings','pathMES','C:\korekty\AGIEVISION_2');
   LabeledEdit6.Text:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
   LabeledEdit7.Text:=ust.ReadString('settings','maxPositionInMagazine','50');
   LabeledEdit8.Text:=ust.ReadString('settings','defaultSideOffset','5');
   LabeledEdit9.Text:=ust.ReadString('settings','pp','30');
   LabeledEdit10.Text:=ust.ReadString('settings','defaultZOffset','-0.03');
   LabeledEdit11.Text:=ust.ReadString('settings','pathVDM','C:\VDM');
   LabeledEdit3.Text:=ust.ReadString('settings','pathCSV','C:\CSV');
   LabeledEdit13.Text:=ust.ReadString('settings','pathCSVexport','V:\Import\CSV');
   LabeledEdit12.Text:=ust.ReadString('settings','minPositionInMagazine','1');
   LabeledEdit14.Text:=ust.ReadString('settings','GCn1x','0');
   LabeledEdit15.Text:=ust.ReadString('settings','GCn1y','0');
   LabeledEdit16.Text:=ust.ReadString('settings','GCn2x','20');
   LabeledEdit17.Text:=ust.ReadString('settings','GCn2y','20');
   LabeledEdit18.Text:=ust.ReadString('settings','GCLineLength','20');
   LabeledEdit19.Text:=ust.ReadString('settings','lang','PL');
   LabeledEdit20.Text:=ust.ReadString('settings','verbseMode','1');
   LabeledEdit21.Text:=ust.ReadString('settings','pathXMLJ','C:\XMLJ');
   rad:=ust.ReadString('settings','electrodeStrategy','1');
   fold:=ust.ReadString('settings','createFolder','1');
   nap:=ust.ReadString('settings','naPen','0');
   agiehp:=ust.ReadString('settings','exportAgieHP','1');
   x400:=ust.ReadString('settings','exportX400','1');
   certa:=ust.ReadString('settings','exportCERTA','1');
   tabf2:=ust.ReadString('settings','tabOrderF2','nowy');
   calcEle:=ust.ReadString('settings','precalculatedElectrodeData','1');
   interlines:=ust.ReadString('settings','moreInterlines','1');
   drawpiece:=ust.ReadString('settings','GCDrawWorkpiece','0');
   zerous:=ust.ReadString('settings','allowZeroUndersize','0');
   if rad='1' then RadioButton1.Checked:=True
   else if rad='2' then RadioButton2.CHecked:=True
   else RadioButton3.Checked:=True;
   if fold='1' then CheckBox1.Checked:=True
   else CheckBox1.Checked:=False;
   if nap='1' then CheckBox2.Checked:=True
   else CheckBox2.Checked:=False;
   if agiehp='1' then CheckBox3.Checked:=True
   else CheckBox3.Checked:=False;
   if x400='1' then CheckBox4.Checked:=True
   else CheckBox4.Checked:=False;
   if certa='1' then CheckBox5.Checked:=True
   else Checkbox5.Checked:=False;
   if tabf2='stary' then RadioButton4.Checked:=True
   else if tabf2='nowy' then RadioButton5.Checked:=True;
   if calcEle='1' then CheckBox6.Checked:=True
   else CheckBox6.Checked:=False;
   if interlines='1' then CheckBox7.Checked:=True
   else CheckBox7.Checked:=False;
   if drawpiece='1' then CheckBox8.Checked:=True
   else CheckBox8.Checked:=False;
   if zerous='1' then CheckBox9.Checked:=True
   else CheckBox9.Checked:=False;
   lang:=ust.ReadString('settings','lang','PL');
   LabeledEdit2.EditLabel.Caption:=DataModule1.getString(lang,60);
   Label1.Caption:=DataModule1.getString(lang,61);
   LabeledEdit4.EditLabel.Caption:=DataModule1.getString(lang,62)+' DXF';
   LabeledEdit5.EditLabel.Caption:=DataModule1.getString(lang,62)+' MES';
   LabeledEdit6.EditLabel.Caption:=DataModule1.getString(lang,62)+' AGIE';
   LabeledEdit11.EditLabel.Caption:=DataModule1.getString(lang,62)+' EDF';
   LabeledEdit3.EditLabel.Caption:=DataModule1.getString(lang,62)+' CSV';
   LabeledEdit13.EditLabel.Caption:=DataModule1.getString(lang,62)+' Dirstruct';
   LabeledEdit8.EditLabel.Caption:=DataModule1.getString(lang,63);  //odl dr bok
   LabeledEdit10.EditLabel.Caption:=DataModule1.getString(lang,64); //offset z
   CheckBox6.Caption:=DataModule1.getString(lang,65); // obrót el o C
   CheckBox7.Caption:=DataModule1.getString(lang,66); //interline
   RadioGroup1.Caption:=DataModule1.getString(lang,67); //strategia tw el
   RadioButton1.Caption:=DataModule1.getString(lang,68);
   RadioButton2.Caption:=DataModule1.getString(lang,69);
   RadioButton3.Caption:=DataModule1.getString(lang,70);
   CheckBox1.Caption:=DataModule1.getString(lang,71); //utwórz folder
   CheckBox2.Caption:=DataModule1.getString(lang,72); //wyslij na pen
   CheckGroup1.Caption:=DataModule1.getString(lang,73); //pokazuj export do
   RadioGroup2.Caption:=DataModule1.getString(lang,74); //kolejnosc pol
   CheckBox8.Caption:=DataModule1.getString(lang,75); //rysuj detal
   Label2.Caption:=DataModule1.getString(lang,76)+' 1';
   Label3.Caption:=DataModule1.getString(lang,76)+' 2';
   LabeledEdit18.EditLabel.Caption:=DataModule1.getString(lang,77); //dlugosc linii
   LabeledEdit19.EditLabel.Caption:=DataModule1.getString(lang,78); //kod jezyka
   LabeledEdit19.Hint:=DataModule1.getString(lang,79)+' PL, EN, DE';
   Button2.Caption:=DataModule1.getString(lang,53);
   Button1.Caption:=DataModule1.getString(lang,80);
   Form3.Caption:=DataModule1.getString(lang,81);

   ust.Free;
end;

procedure TForm3.LabeledEdit12Change(Sender: TObject);
begin

end;

end.

