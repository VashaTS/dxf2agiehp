unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, StrUtils, IniFiles, Unit10;

type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioGroup1: TRadioGroup;
    procedure Button2Click(Sender: TObject);
    procedure ctd(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure vcir(Sender: TObject);
    procedure vlin(Sender: TObject);
    procedure vmat(Sender: TObject);
    procedure vpoj(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.lfm}

{ TForm7 }

procedure TForm7.Button2Click(Sender: TObject);
begin

end;

procedure TForm7.ctd(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if AnsiContainsStr((Sender as TLabeledEdit).Text,',') then begin
        (Sender as TLabeledEdit).Text:=StringReplace((Sender as TLabeledEdit).Text,',','.',[rfReplaceAll]);
        (Sender as TLabeledEdit).SelStart:=high(Integer);
     end;
end;

procedure TForm7.FormCreate(Sender: TObject);
var ust:TIniFile;
  lang:string;
begin
     ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     lang:=ust.ReadString('settings','lang','PL');
     ust.Free;
     Image1.Picture.LoadFromLazarusResource('agievision_copy1');
     Form7.Caption:=DataModule1.getString(lang,85)+'...'; //form title
     Button2.Caption:=DataModule1.getString(lang,53); //cancel button
     RadioGroup1.Caption:=DataModule1.getString(lang,91); //funkcje kopiwania
end;

procedure TForm7.vcir(Sender: TObject);
var ust:TIniFile;
  lang:string;
begin
  ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  lang:=ust.ReadString('settings','lang','PL');
  ust.Free;
  if RadioButton4.Checked then begin
   Image1.Picture.LoadFromLazarusResource('agievision_copy4');
   LabeledEdit1.EditLabel.Caption:=DataModule1.getString(lang,86);
   LabeledEdit1.Text:='0.0';
   LabeledEdit2.EditLabel.Caption:=DataModule1.getString(lang,87);
   LabeledEdit2.Text:='0.0';
   LabeledEdit3.EditLabel.Caption:=DataModule1.getString(lang,88);
   LabeledEdit3.Text:='0.0';
   LabeledEdit4.EditLabel.Caption:=DataModule1.getString(lang,89);
   LabeledEdit4.Text:='0.0';
   LabeledEdit5.EditLabel.Caption:=DataModule1.getString(lang,90);
   LabeledEdit5.Text:='1';
   LabeledEdit5.Visible:=True;
  end;
end;

procedure TForm7.vlin(Sender: TObject);
var ust:TIniFile;
  lang:string;
begin
  ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  lang:=ust.ReadString('settings','lang','PL');
  ust.Free;
  if RadioButton2.Checked then begin
    Image1.Picture.LoadFromLazarusResource('agievision_copy2');
    LabeledEdit1.EditLabel.Caption:=DataModule1.getString(lang,92)+' X';
    LabeledEdit1.Text:='0.0';
    LabeledEdit2.EditLabel.Caption:=DataModule1.getString(lang,92)+' Y';
    LabeledEdit2.Text:='0.0';
    LabeledEdit4.EditLabel.Caption:=DataModule1.getString(lang,90);
    LabeledEdit4.Text:='2';
    LabeledEdit3.EditLabel.Caption:=DataModule1.getString(lang,92)+' Z';
    LabeledEdit3.Text:='0.0';
    LabeledEdit5.Visible:=False;
  end;
end;

procedure TForm7.vmat(Sender: TObject);
var ust:TIniFile;
  lang:string;
begin
  ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  lang:=ust.ReadString('settings','lang','PL');
  ust.Free;
  if RadioButton3.Checked then begin
    Image1.Picture.LoadFromLazarusResource('agievision_copy3');
    LabeledEdit1.EditLabel.Caption:=DataModule1.getString(lang,92)+' X';
    LabeledEdit1.Text:='0.0';
    LabeledEdit2.EditLabel.Caption:=DataModule1.getString(lang,92)+' Y';
    LabeledEdit2.Text:='0.0';
    LabeledEdit4.EditLabel.Caption:=DataModule1.getString(lang,93);
    LabeledEdit4.Text:='2';
    LabeledEdit3.EditLabel.Caption:=DataModule1.getString(lang,94);
    LabeledEdit3.Text:='2';
    LabeledEdit5.Visible:=False;
  end;
end;

procedure TForm7.vpoj(Sender: TObject);
var ust:TIniFile;
  lang:string;
begin
  ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  lang:=ust.ReadString('settings','lang','PL');
  ust.Free;
  If RadioButton1.Checked then begin
    Image1.Picture.LoadFromLazarusResource('agievision_copy1');
    LabeledEdit1.EditLabel.Caption:=DataModule1.getString(lang,92)+' X';
    LabeledEdit1.Text:='0.0';
    LabeledEdit2.EditLabel.Caption:=DataModule1.getString(lang,92)+' Y';
    LabeledEdit2.Text:='0.0';
    LabeledEdit4.EditLabel.Caption:=DataModule1.getString(lang,92)+' C';
    LabeledEdit4.Text:='0.0';
    LabeledEdit3.EditLabel.Caption:=DataModule1.getString(lang,92)+' Z';
    LabeledEdit3.Text:='0.0';
    LabeledEdit5.Visible:=False;
  end;
end;

end.

