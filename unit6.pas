unit Unit6;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, EditBtn, Grids, ColorBox, ValEdit, DateUtils;

type
  TArrayOfString = array of String;
  { TForm6 }

  TForm6 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    DateEdit1: TDateEdit;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure oad(Sender: TObject; var ADate: TDateTime;
      var AcceptDate: Boolean);
    procedure oad2(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.lfm}

function SplitString(const aSepator, aString:string;aMax:integer=0):TArrayOfString;
var i,strt,cnt,sepLen:integer;
  procedure AddString(aEnd:integer=-1);
  var endPos:integer;
    begin
    if (aEnd=-1) then endPos:=i
    else endPos:= aEnd+1;
    if (strt<endPos) then result[cnt]:=Copy(aString,strt,endPos-strt)
    else result[cnt]:='';
    inc(cnt);
    end;
begin
 if (aString='') or (aMax<0) then
 begin
   SetLength(result,0);
   EXIT;
 end;
 sepLen:=Length(aSepator);
 SetLength(result,(Length(aString) div sepLen)+1);
 i:=1;
 strt:=i;
 cnt:=0;
 while(i<=(Length(aString)-sepLen+1)) do
 begin
   if (aString[i]=aSepator[1]) then
    if (Copy(aString,i,sepLen)=aSepator) then
     begin
       AddString;
       if (cnt=aMax) then
        begin
          SetLength(result,cnt);
          EXIT;
        end;
       Inc(i,sepLen-1);
       strt:=i+1;
     end;
   inc(i);
 end;
 AddString(length(aString));
 SetLength(result,cnt);
end;

function isNumber(s:string):boolean;
var i:integer;
begin
     i:=1;
     while (i<=length(s)) and (s[i] in ['0'..'9','.','E']) do inc(i);
     result:=i>length(s);
end;

procedure readLog;
var i,j:integer;
  sl:TStringList;
  sp:TArrayOfString;
  joint_str:string;
begin
  //if Form6.StringGrid1.RowCount>1 then for i:=(Form6.StringGrid1.RowCount-1) downto 1 do Form6.StringGrid1.Rows[i].Clear; //delete old data, if any
 Form6.StringGrid1.RowCount:=1;
 sl:=TStringList.Create;
   sl.LoadFromFile(Application.Location+'\logfile'+inttostr(YearOf(Now))+'.log');
   for i:= 0 to sl.Count-1 do begin
       sp:=SplitString(' ',sl.Strings[i]);
       if strtodatetime(sp[0])=Form6.DateEdit1.Date then begin
         Form6.StringGrid1.RowCount:=Form6.StringGrid1.RowCount+1;

         Form6.StringGrid1.Cells[0,(Form6.StringGrid1.RowCount-1)]:=sp[0];
         Form6.StringGrid1.Cells[1,(Form6.StringGrid1.RowCount-1)]:=sp[1];
         Form6.StringGrid1.Cells[2,(Form6.StringGrid1.RowCount-1)]:=sp[2];
         joint_str:=sp[3];
         for j:=4 to length(sp)-1 do joint_str:=joint_str+' '+sp[j];
         Form6.StringGrid1.Cells[3,(Form6.StringGrid1.RowCount-1)]:=joint_str;
         {if sp[2]='ERR' then begin
            Form6.StringGrid1.Canvas.Brush.Color:=clRed;
            Form6.StringGrid1.Canvas.FillRect(0,(Form6.StringGrid1.RowCount-1)*22,650,Form6.StringGrid1.RowCount*22);
         end;}
       end;
   end;
   sl.Destroy;
   Form6.StringGrid1.Refresh;
end;

{ TForm6 }

procedure TForm6.FormCreate(Sender: TObject);


begin
  StringGrid1.Cells[0,0]:='Data';
  StringGrid1.Cells[1,0]:='Czas';
  StringGrid1.Cells[2,0]:='Typ';
  StringGrid1.Cells[3,0]:='Opis';
  StringGrid1.ColWidths[0]:=70;
  StringGrid1.ColWidths[1]:=50;
  StringGrid1.ColWidths[2]:=50;
  StringGrid1.ColWidths[3]:=700;
  readLog;
end;

procedure TForm6.oad(Sender: TObject; var ADate: TDateTime;
  var AcceptDate: Boolean);
begin
   readLog;
end;

procedure TForm6.oad2(Sender: TObject);
begin
  readLog;
end;

procedure TForm6.Button3Click(Sender: TObject);
begin
  DateEdit1.Date:=DateEdit1.Date+1;
  readLog;
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  DateEdit1.Date:=Now;
  readLog;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  DateEdit1.Date:=DateEdit1.Date-1;
  readLog;
end;

end.

