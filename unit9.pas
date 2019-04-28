unit Unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls, inifiles;

type

  { TForm9 }

  TForm9 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.lfm}

{ TForm9 }

procedure TForm9.Button1Click(Sender: TObject);
begin
  Form9.Close;
end;

procedure TForm9.Button2Click(Sender: TObject);
var ust:TIniFile;
begin
  ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     SysUtils.ExecuteProcess('explorer.exe','/select,'+ust.ReadString('settings','pathOutput','c:\')+'\'+Label2.Caption);
     ust.Free;
     Form9.Close;
end;

end.

