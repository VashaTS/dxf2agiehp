unit Unit7;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, StrUtils;

type

  { TForm7 }

  TForm7 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    PaintBox1: TPaintBox;
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
begin
  with PaintBox1.Canvas do
  begin
    //Repaint;
    //Pen.Style:=psSolid;
    Brush.Color:=clBlack;
    //Pen.Color:=clBlack;
    Brush.Style:=bsDiagCross;
    Ellipse(10,10,20,20);
    Refresh;
  end;
end;

procedure TForm7.vcir(Sender: TObject);
begin
   LabeledEdit1.EditLabel.Caption:='Środek X';
   LabeledEdit1.Text:='0.0';
   LabeledEdit2.EditLabel.Caption:='Środek Y';
   LabeledEdit2.Text:='0.0';
   LabeledEdit3.EditLabel.Caption:='Kąt obrotu';
   LabeledEdit3.Text:='0.0';
   LabeledEdit4.EditLabel.Caption:='Rotacja kopii';
   LabeledEdit4.Text:='0.0';
   LabeledEdit5.EditLabel.Caption:='Ilość kopii';
   LabeledEdit5.Text:='1';
   LabeledEdit5.Visible:=True;
end;

procedure TForm7.vlin(Sender: TObject);
begin
  if RadioButton2.Checked then begin
    LabeledEdit1.EditLabel.Caption:='Zwiększenie X';
    LabeledEdit1.Text:='0.0';
    LabeledEdit2.EditLabel.Caption:='Zwiększenie Y';
    LabeledEdit2.Text:='0.0';
    LabeledEdit4.EditLabel.Caption:='Ilość kopii';
    LabeledEdit4.Text:='2';
    LabeledEdit3.EditLabel.Caption:='Zwiększenie Z';
    LabeledEdit3.Text:='0.0';
    LabeledEdit5.Visible:=False;
  end;
end;

procedure TForm7.vmat(Sender: TObject);
begin
  if RadioButton3.Checked then begin
    LabeledEdit1.EditLabel.Caption:='Zwiększenie X';
    LabeledEdit1.Text:='0.0';
    LabeledEdit2.EditLabel.Caption:='Zwiększenie Y';
    LabeledEdit2.Text:='0.0';
    LabeledEdit4.EditLabel.Caption:='Ilość kolumn';
    LabeledEdit4.Text:='2';
    LabeledEdit3.EditLabel.Caption:='Ilość wierszy';
    LabeledEdit3.Text:='2';
    LabeledEdit5.Visible:=False;
  end;
end;

procedure TForm7.vpoj(Sender: TObject);
begin
  If RadioButton1.Checked then begin
    LabeledEdit1.EditLabel.Caption:='Zwiększenie X';
    LabeledEdit1.Text:='0.0';
    LabeledEdit2.EditLabel.Caption:='Zwiększenie Y';
    LabeledEdit2.Text:='0.0';
    LabeledEdit4.EditLabel.Caption:='Zwiększenie C';
    LabeledEdit4.Text:='0.0';
    LabeledEdit3.EditLabel.Caption:='Zwiększenie Z';
    LabeledEdit3.Text:='0.0';
    LabeledEdit5.Visible:=False;
  end;
end;

end.

