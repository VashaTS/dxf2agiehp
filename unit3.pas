unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls,inifiles, ShlObj, Registry;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioGroup1: TRadioGroup;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SelectDirectoryDialog2: TSelectDirectoryDialog;
    SelectDirectoryDialog3: TSelectDirectoryDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.Button1Click(Sender: TObject);
var ust:TIniFile;
begin
   ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   ust.WriteString('settings','defaultNoOfRows',LabeledEdit1.Text);
   ust.WriteString('settings','defaultElectrodeMaterial',LabeledEdit2.Text);
   ust.WriteString('settings','defaultPieceMaterial',LabeledEdit3.Text);
   ust.WriteString('settings','pathDXF',LabeledEdit4.Text);
   ust.WriteString('settings','pathMES',LabeledEdit5.Text);
   ust.WriteString('settings','pathOutput',LabeledEdit6.Text);
   ust.WriteString('settings','maxPositionInMagazine',LabeledEdit7.Text);
   if RadioButton1.Checked=True then ust.WriteString('settings','electrodeStrategy','1')
   else if RadioButton2.Checked=True then ust.WriteString('settings','electrodeStrategy','2')
   else if RadioButton3.Checked=True then ust.WriteString('settings','electrodeStrategy','3');
   ust.Free;
   Form3.Close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Form3.Close;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
  if SelectDirectoryDialog1.Execute then LabeledEdit4.Text:=SelectDirectoryDialog1.FileName;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
  if SelectDirectoryDialog2.Execute then LabeledEdit5.Text:=SelectDirectoryDialog2.FileName;
end;

procedure TForm3.Button5Click(Sender: TObject);
begin
  if SelectDirectoryDialog3.Execute then LabeledEdit6.Text:=SelectDirectoryDialog3.FileName;
end;

procedure TForm3.Button6Click(Sender: TObject);
begin
  with TRegistry.Create do
    try
      RootKey:=HKEY_CURRENT_USER;
      if OpenKey('\Software\Classes\.dxf', true) then WriteString('','Dxf2AgiehpFile');
      if OpenKey('\Software\Classes\Dxf2AgiehpFile', true) then WriteString('','Dxf File');
      if OpenKey('\Software\Classes\Dxf2AgiehpFile\DefaultIcon', true) then WriteString('',Application.Location+'icon_file.ico');
      if OpenKey('\Software\Classes\Dxf2AgiehpFile\shell\open\command', true) then WriteString('',Application.ExeName+' "%1"');
    finally
      Free;
    end;
  SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, nil, nil);
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
end;

procedure TForm3.FormCreate(Sender: TObject);
var ust:TIniFile;
rad:string;
begin
   ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   LabeledEdit1.Text:=ust.ReadString('settings','defaultNoOfRows','10');
   LabeledEdit2.Text:=ust.ReadString('settings','defaultElectrodeMaterial','Graphite2');
   LabeledEdit3.Text:=ust.ReadString('settings','defaultPieceMaterial','Steel');
   LabeledEdit4.Text:=ust.ReadString('settings','pathDXF','C:\Intel\LazarusPortable\dxf test');
   LabeledEdit5.Text:=ust.ReadString('settings','pathMES','C:\korekty\AGIEVISION_2');
   LabeledEdit6.Text:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
   LabeledEdit7.Text:=ust.ReadString('settings','maxPositionInMagazine','50');
   rad:=ust.ReadString('settings','electrodeStrategy','1');
   if rad='1' then RadioButton1.Checked:=True
   else if rad='2' then RadioButton2.CHecked:=True
   else RadioButton3.Checked:=True;
   ust.Free;
end;

end.

