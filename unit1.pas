unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Comctrls, Spin, Menus, Math, Unit2, Unit3, Unit4, Unit5,
  Unit6, DCPsha256, inifiles, StrUtils, DateUtils, Windows,
  LResources, Buttons, Unit7,Unit8,Unit9,ShellAPI;

type
  TArrayOfString = array of String;
  TAAS = array of TArrayOfSTring;

 // TBitBtn = class (Buttons.TBitBtn)
 //   protected
 //     procedure Create(TheOwner: TComponent); override;
 // end;

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Button1: TButton;
    Button14: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button7: TButton;
    Button8: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    ImageList1: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LabeledEdit1: TLabeledEdit;
    ListBox1: TListBox;
    ListBox10: TListBox;
    ListBox11: TListBox;
    ListBox12: TListBox;
    ListBox13: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    ListBox4: TListBox;
    ListBox5: TListBox;
    ListBox6: TListBox;
    ListBox7: TListBox;
    ListBox8: TListBox;
    ListBox9: TListBox;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    OpenDialog3: TOpenDialog;
    OpenDialog4: TOpenDialog;
    PaintBox1: TPaintBox;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    SaveDialog2: TSaveDialog;
    SaveDialog3: TSaveDialog;
    SpinEdit1: TSpinEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure chkeckTypedDir(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure comatodot(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure handleparams(Sender: TObject);
    procedure hp2(Sender: TObject; const FileNames: array of String);
    procedure loadpos(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure loadpos(Sender: TObject; var Key: char);
    procedure loadpos(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure loadpos(Sender: TObject; User: boolean);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure nospaces(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure resizemainf(Sender: TObject);
    procedure sds(Sender: TObject);
    procedure setchmathod(Sender: TObject);
    procedure shlogf(Sender: TObject);
    procedure validate_piece_x400(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  end_table_line,offset,tableno,errorlevel,gel:integer;
  plsr12sc,sizeset:boolean;
  sw_ver,sw_ver_minor:string;



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

function isNumeric(s:string):boolean;
var i:integer;
begin
     i:=1;
     while (i<=length(s)) and (s[i] in ['0'..'9']) do inc(i);
     result:=i>length(s);
end;
function isNumeric2(s:string):boolean;
var i:integer;
begin
     i:=1;
     while (i<=length(s)) and (s[i] in ['0'..'9','-']) do inc(i);
     result:=i>length(s);
end;

function isSignedFloat(s:string):boolean;
var i:integer;
begin
     i:=1;
     while (i<=length(s)) and (s[i] in ['0'..'9','.','-']) do inc(i);
     result:=i>length(s);
end;

function normalize_c(inp:real):real;
begin
    repeat
    if inp>360 then inp:=inp-360;
    if inp<-360 then inp:=inp+360;
    until abs(inp)<360;
    if inp<-315 then result:=inp+360
    else if ((inp<-225) and (inp>-315)) then result:=inp+270
    else if ((inp<-135) and (inp>-225)) then result:=inp+180
    else if ((inp<-45)  and (inp>-135)) then result:=inp+90
    else if ((inp>-45) and (inp<45)) then result:=inp
    else if ((inp>45) and (inp<135)) then result:=inp-90
    else if ((inp>135) and (inp<225)) then result:=inp-180
    else if ((inp>225) and (inp<315)) then result:=inp-270
    else result:=inp-360;
end;

Function roundto(FloatNum: Double; NoOfDecPart: integer): Double;
Var ls_FloatNumber: String;
Begin
 ls_FloatNumber := FloatToStr(FloatNum);
    IF Pos('.', ls_FloatNumber) > 0 Then Result := StrToFloat (copy(ls_FloatNumber, 1, Pos('.', ls_FloatNumber) - 1) + '.' + copy (ls_FloatNumber, Pos('.', ls_FloatNumber) + 1, NoOfDecPart))
    Else Result := FloatNum;
End;

function vdi_nr_to_ii(inp:string):integer;
begin
 case inp of
   'VDI30': result:=0;
   'VDI29': result:=1;
   'VDI28': result:=2;
   'VDI27': result:=3;
   'VDI26': result:=4;
   'VDI25': result:=5;
   'VDI24': result:=6;
   'VDI23': result:=7;
   'VDI22': result:=8;
   'VDI21': result:=9;
   'VDI20': result:=10;
   'VDI19': result:=11;
   'VDI18': result:=12;
   'VDI17': result:=13;
   'VDI16': result:=14;
   else result:=4; //in case of bad table input, choose default
 end;
end;

function vdi_ii_to_nr(inp:integer):string;
begin
 case inp of
   0: result:='VDI30';
   1: result:='VDI29';
   2: result:='VDI28';
   3: result:='VDI27';
   4: result:='VDI26';
   5: result:='VDI25';
   6: result:='VDI24';
   7: result:='VDI23';
   8: result:='VDI22';
   9: result:='VDI21';
   10: result:='VDI20';
   11: result:='VDI19';
   12: result:='VDI18';
   13: result:='VDI17';
   14: result:='VDI16';
 end;
end;

function elmatii_input(inp:string):integer;
begin
 case inp of
   'Graphite1': result:=0;
   'Graphite2': result:=1;
   'Copper': result:=2;
   'Kupfer': result:=2;
   else result:=1;
 end;

end;

function elmatii_output(inp:integer):string;
begin
 case inp of
   0: result:='Graphite1';
   1: result:='Graphite2';
   2: result:='Copper';
   else result:='Graphite2';
 end;
end;

function mat_x400(inp:string):string;
begin
 case inp of
   'Graphite1': result:='GF';
   'Graphite2': result:='GM';
   'Copper': result:='CU';
   else result:='GM';
 end;
end;

function mat_x400_code(inp:string):string;
begin
 case inp of
    'Graphite1': result:='1';
    'Graphite2': result:='2';
    'Copper': result:='4';
    else result:='2';
 end;
end;

function ii_to_agie_pmat(inp:integer):string;
begin
 case inp of
   0: result:='0001'; //steel
   1: result:='0002'; //hard metal
   2: result:='0003'; //aluminium
   3: result:='0004'; //titanium
   4: result:='0005'; //copper
   5: result:='0006'; //coper base alloy
   6: result:='0007'; //nickel base alloy
   7: result:='0008'; //cast iron
 end;
end;

procedure langStrings();
begin

end;

procedure setChanged(state:boolean);
begin
 Form1.CheckBox6.Checked:=state;
end;

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

function vdi_num_to_agie(inp:string):string;
begin
 case inp of //write the choosen surface quality
          'VDI30': result:='VDI_30Ra3.17oxxo,1,$,  3.170000';
          'VDI29': result:='VDI_29Ra2.82oxxo,1,$,  2.820000';
          'VDI28': result:='VDI_28Ra2.51oxxo,1,$,  2.510000';
          'VDI27': result:='VDI_27Ra2.24oxxo,1,$,  2.240000';
          'VDI26': result:='VDI_26Ra2.0oxxo,1,$,  2.000000';
          'VDI25': result:='VDI_25Ra1.78oxxo,1,$,  1.780000';
          'VDI24': result:='VDI_24Ra1.59oxxo,1,$,  1.590000';
          'VDI23': result:='VDI_23Ra1.41oxxo,1,$,  1.410000';
          'VDI22': result:='VDI_22Ra1.26oxxo,1,$,  1.260000';
          'VDI21': result:='VDI_21Ra1.12oxxo,1,$,  1.120000';
          'VDI20': result:='VDI_20Ra1.0oxxo,1,$,  1.000000';
          'VDI19': result:='VDI_19Ra0.89oxxo,1,$,  0.890000';
          'VDI18': result:='VDI_18Ra0.79oxxo,1,$,  0.790000';
          'VDI17': result:='VDI_17Ra0.71oxxo,1,$,  0.710000';
          'VDI16': result:='VDI_16Ra0.65oxxo,1,$,  0.650000';
          else begin
              result:='VDI_26Ra2.0oxxo,1,$,  2.000000'; //to prevent program crashing the machine on bad table input
              logToFile('wrong VDI number, usinng default','ERR');
              end;
     end;

end;

procedure load_csv(inp:string);
var cf:TextFile;
  j,k:integer;
  line,csvtype:string;
  l0,l1:TArrayOfString;
  namr,generated,el_exists:boolean;
  ust:TIniFile;
begin
     AssignFile(cf,inp);
     reset(cf);
     Form1.ListBox1.Clear;
     Form1.ListBox2.Clear;
     Form1.ListBox3.Clear;
     Form1.ListBox4.Clear;
     Form1.ListBox5.Clear;
     Form1.ListBox6.Clear;
     Form1.ListBox7.Clear;
     Form1.ListBox8.Clear;
     Form1.ListBox9.Clear;
     Form1.ListBox10.Clear;
     Form1.ListBox11.Clear;
     Form1.ListBox12.Clear;
     Form2.ListBox1.Clear;
     Form2.ListBox2.Clear;
     Form2.CheckListBox1.Clear;
     namr:=False; //next line has workpiece name
     generated:=False; //csv generated by dxf2agieghp
     csvtype:='excelcsv';
     readln(cf,line);
     ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     if line='Beschreibung Werkstueck' then csvtype:='pureseb';
     repeat
        readln(cf,line);
        //showmessage(csvtype);
        case csvtype of
           'excelcsv': begin
           l0:=SplitString(';',line);
           if namr then Form1.Edit3.Text:=l0[0];
           if l0[0]='Materialno.' then namr:=True
           else namr:=False;
           if l0[0]='Yes' then begin
             Form1.ListBox2.Items.Add(l0[2]); //name
             Form1.ListBox3.Items.Add(l0[6]); //x
             Form1.ListBox4.Items.Add(l0[7]); //y
             Form1.ListBox5.Items.Add(l0[8]); //c
             Form1.ListBox9.Items.Add(l0[9]); //dir
             Form1.ListBox6.Items.Add(l0[10]); //z
             Form1.ListBox12.Items.Add(l0[11]); //vdi
             Form1.ListBox7.Items.Add(l0[12]); //mat el
             Form1.ListBox8.Items.Add(l0[13]); //fp
             Form1.ListBox11.Items.Add(ust.ReadString('settings','defaultSideOffset','5')); // side offset
             end;
           end;
           'pureseb': begin
               l0:=SplitString(';',line);
               if namr then Form1.Edit3.Text:=l0[0];
               if line='NAME; PIECE_WIDTH; PIECE_LENGTH; PIECE_HEIGHT; MATR; X; Y' then namr:=True
               else namr:=False;
               if line='generated;dxf2agiehp' then generated:=True;
               //showmessage(inttostr(length(l0)));
               if length(l0)=29 then begin
                 if AnsiContainsStr(l0[0],'/') then begin
                     l1:=SplitString('/',l0[0]);
                     Form1.ListBox2.Items.Add(l1[2]);
                 end
                 else Form1.ListBox2.Items.Add(l0[0]); //name
                 Form1.ListBox3.Items.Add(l0[4]); //x
                 Form1.ListBox4.Items.Add(l0[5]); //y
                 Form1.ListBox5.Items.Add(l0[6]); //c
                 Form1.ListBox9.Items.Add(l0[7]); //dir
                 Form1.ListBox6.Items.Add(l0[8]); //z
                 Form1.ListBox12.Items.Add(l0[9]); //vdi
                 Form1.ListBox7.Items.Add(l0[10]); //mat el
                 Form1.ListBox8.Items.Add(l0[11]); //fp
                 Form1.ListBox11.Items.Add(ust.ReadString('settings','defaultSideOffset','5')); // side offset
                 if generated then begin
                   j:=(Form1.ListBox2.Count-1);
                   el_exists:=False; //mark electrode as not exist
                   if Form2.CheckListBox1.Count>0 then begin
                      for k:=0 to (Form2.CheckListBox1.Count-1) do begin //for each already known electrode
                          if Form2.CheckListBox1.Items[k]=trim(Form1.ListBox2.Items[j]) then el_exists:=True; //mark electrode that already exist
                      end;
                   end;
                   if el_exists=False then begin //if electrode is marked not existing
                      Form2.CheckListBox1.Items.Add(trim(Form1.ListBox2.Items[j])); //add to visible list
                      Form2.CheckListBox1.Checked[(Form2.CheckListBox1.Count-1)]:=True;
                      if Form1.CheckBox1.Checked=False then begin
                         if Form1.CheckBox4.Checked=False then Form2.ListBox1.Items.Add(trim(Form1.ListBox2.Items[j])+';'+Form1.ListBox7.Items[j]+';'+Form1.ListBox8.Items[j]+';'+l0[13]+';'+l0[15]+';'+l0[17]+';'+l0[19]+';0;0;'+l0[12]+';'+l0[14]+';'+l0[16]+';'+l0[18]+';0;0;'+trim(Form1.ListBox2.Items[j])+';0;'+Form1.ListBox9.Items[j]+';5;0;'+Form1.ListBox12.Items[j]) //add parameters to invisible list
                         else Form2.ListBox1.Items.Add(trim(Form1.ListBox2.Items[j])+';'+Form1.ListBox7.Items[j]+';'+Form1.ListBox8.Items[j]+';'+l0[13]+';'+l0[15]+';'+l0[17]+';'+l0[19]+';0;0;'+l0[12]+';'+l0[14]+';'+l0[16]+';'+l0[18]+';0;0;'+trim(Form1.ListBox2.Items[j])+';0;'+Form1.ListBox9.Items[j]+';5;0;'+vdi_ii_to_nr(Form1.ComboBox2.ItemIndex)); // replace vdi
                      end
                      else begin
                           if Form1.CheckBox4.Checked=False then Form2.ListBox1.Items.Add(trim(Form1.ListBox2.Items[j])+';'+Form1.ComboBox1.Items[Form1.ComboBox1.ItemIndex]+';'+Form1.ListBox8.Items[j]+';'+l0[13]+';'+l0[15]+';'+l0[17]+';'+l0[19]+';0;0;'+l0[12]+';'+l0[14]+';'+l0[16]+';'+l0[18]+';0;0;'+trim(Form1.ListBox2.Items[j])+';0;'+Form1.ListBox9.Items[j]+';5;0;'+Form1.ListBox12.Items[j])  // replace material if choosen so
                           else Form2.ListBox1.Items.Add(trim(Form1.ListBox2.Items[j])+';'+Form1.ComboBox1.Items[Form1.ComboBox1.ItemIndex]+';'+Form1.ListBox8.Items[j]+';'+l0[13]+';'+l0[15]+';'+l0[17]+';'+l0[19]+';0;0;'+l0[12]+';'+l0[14]+';'+l0[16]+';'+l0[18]+';0;0;'+trim(Form1.ListBox2.Items[j])+';0;'+Form1.ListBox9.Items[j]+';5;0;'+vdi_ii_to_nr(Form1.ComboBox2.ItemIndex));  // replace material if choosen so + replace vdi
                      end;
                   end;
                 end;
               end;
           end;
        end; //case
     until eof(cf);
     Form1.CheckBox7.Checked:=generated;
     if generated then Form2.Label13.Caption:='done';
     ust.Free;
     logToFile('Loaded CSV: '+inp,'OK');
     CloseFile(cf);
     setChanged(true);
end;

procedure load_edf(inp:string);
var rf:TextFile;
  line,path,fil_ver,v15b:string;
  l1,l2:TArrayOfString;
  ust:TIniFile;
begin
     // load saved state of 2 main forms.
     AssignFile(rf,inp);
     reset(rf);
     Form1.ListBox1.Clear;
     Form1.ListBox2.Clear;
     Form1.ListBox3.Clear;
     Form1.ListBox4.Clear;
     Form1.ListBox5.Clear;
     Form1.ListBox6.Clear;
     Form1.ListBox7.Clear;
     Form1.ListBox8.Clear;
     Form1.ListBox9.Clear;
     Form1.ListBox10.Clear;
     Form1.ListBox11.Clear;
     Form1.ListBox12.Clear;
     Form2.ListBox1.Clear;
     Form2.ListBox2.Clear;
     Form2.CheckListBox1.Clear;
     repeat
        readln(rf,line);
        if AnsiContainsStr(line,'DXF2AGIEHPv') then begin
           l1:=SplitString('v',line);
           if l1[1]<>sw_ver then begin
              ShowMessage('Uwaga! Wczytany plik zostal zapisany w innej wersji programu. Sprawdź poprawnosc danych.'+AnsiString(#13#10)+'Wersja aplikacji: '+sw_ver+AnsiString(#13#10)+'Wersja pliku: '+l1[1]);
              logToFile('Current version: '+sw_ver+', file version: '+l1[1],'INF');
           end;
           fil_ver:=l1[1];
        end
        else begin
          l1:=SplitString(':',line);
          Form1.Edit16.Text:='00'; //backwards compability for files older than v15
          case l1[0] of
             'zme': begin
               if l1[1]='1' then Form1.CheckBox1.Checked:=True
               else Form1.CheckBox1.Checked:=False;
             end;
             'zjp': begin
               if l1[1]='1' then Form1.CheckBox4.Checked:=True
               else Form1.CheckBox4.Checked:=False;
             end;
             'crgr': begin
               if l1[1]='1' then Form1.CheckBox3.Checked:=True
               else Form1.CheckBox3.Checked:=False;
             end;
             'matel': Form1.ComboBox1.ItemIndex:=strtoint(l1[1]);
             'vdisel': Form1.ComboBox2.ItemIndex:=strtoint(l1[1]);
             'matdet': Form1.ComboBox4.ItemIndex:=strtoint(l1[1]);
             'prname': Form1.Edit3.Text:=l1[1];
             'odlx': Form1.Edit11.Text:=l1[1];
             'odly': Form1.Edit12.Text:=l1[1];
             'odlz': Form1.Edit13.Text:=l1[1];
             'odlc': Form1.Edit14.Text:=l1[1];
             'ilekol': Form1.SpinEdit1.Value:=strtoint(l1[1]);
             'lbpwt': Form1.ListBox1.Items.Add(l1[1]);
             'lbname': Form1.ListBox2.Items.Add(l1[1]);
             'lbx': Form1.ListBox3.Items.Add(l1[1]);
             'lby': Form1.ListBox4.Items.Add(l1[1]);
             'lbc': Form1.ListBox5.Items.Add(l1[1]);
             'lbz': Form1.ListBox6.Items.Add(l1[1]);
             'lbmat': Form1.ListBox7.Items.Add(l1[1]);
             'lbfp': Form1.ListBox8.Items.Add(l1[1]);
             'lbdirb': Form1.ListBox9.Items.Add(l1[1]);
             'lbodsb': Form1.ListBox11.Items.Add(l1[1]);
             'lbvdi': Form1.ListBox12.Items.Add(l1[1]);
             'lbf21': begin
                           if strtoint(fil_ver)>=16 then Form2.ListBox1.Items.Add(l1[1])
                           else begin
                              l2:=SplitString(';',l1[1]);  //compatibility for older versions
                              v15b:=l2[0]+';'+l2[1]+';'+l2[2]+';'+l2[3]+';'+l2[4]+';'+l2[5]+';'+l2[6]+';0;0;'+l2[7]+';'+l2[8]+';'+l2[9]+';'+l2[10]+';0;0;'+l2[11]+';'+l2[12]+';'+l2[13]+';'+l2[14]+';'+l2[15]+';'+l2[16];
                              if length(l2)=18 then v15b:=v15b+';'+l2[17];
                              //ShowMessage(inttostr(length(l2)));
                              Form2.ListBox1.Items.Add(v15b);
                           end;
                      end;
             'lbf22': Form2.ListBox2.Items.Add(l1[1]);
             'eld': Form2.Label13.Caption:=l1[1];
             'clbf2': begin
               Form2.CheckListBox1.Items.Add(l1[1]);
               if l1[2]='1' then Form2.CheckListBox1.Checked[(Form2.CheckListBox1.Count-1)]:=True
               else Form2.CheckListBox1.Checked[(Form2.CheckListBox1.Count-1)]:=False;
             end;
             'date': Form1.Edit15.Text:=l1[1];
             'ai': Form1.Edit16.Text:=l1[1];
             'magpos_x400': Form1.LabeledEdit1.Text:=l1[1]; //added in v17
             'dodsk': begin
               if l1[1]='1' then Form1.CheckBox8.Checked:=True
               else Form1.CheckBox8.Checked:=False;
             end;
             'generated': begin
               if l1[1]='1' then Form1.CheckBox7.Checked:=True
               else Form1.CheckBox7.Checked:=False;
             end;
          end;
        end;
     until eof(rf);
     CloseFile(rf);
     Form1.Caption:='DXF to AGIE HP ['+inp+']';
     ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     path:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
     ust.Free;
     Form1.Label17.Visible:=directoryExists(path+'\'+Form1.Edit3.Text);
     Form1.CheckBox5.Checked:=True;
     Form1.SaveDialog1.FileName:=inp;
     logToFile('Loaded file '+inp+' succesfully','OK');
     setChanged(false);
end;

function matforagie(inp:string):string;
begin
 case inp of
     'Grafit1': result:='0001'; //SEB
     'Graphite1': result:='0001';
     'Grafit 3neu': result:='0001'; //SEB
     'Grafit2': result:='0002'; //SEB
     'Graphite2': result:='0002';
     'Graphite2/Graphite3': result:='0002'; // CREO
     'Copper': result:='0004';
     end;
end;

{ TForm1 }



procedure TForm1.shlogf(Sender: TObject);
begin
  Form6.ShowModal;
end;

procedure TForm1.validate_piece_x400(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var pa:TArrayOfString;
  ok:boolean;
  i:integer;
begin
   ok:=True;
   if length(LabeledEdit1.Text)>0 then begin
      pa:=SplitString(',',LabeledEdit1.Text);
      for i:=0 to length(pa)-1 do begin
        if ((isNumeric2(pa[i])) and (length(pa[i])>0)) then if pa[i]<>'-' then if ((strtoint(pa[i])<1) or (strtoint(pa[i])>48)) then ok:=False;
        if length(pa[i])=0 then ok:=False;
        if not isNumeric2(pa[i]) then ok:=False;
        if pa[i]='-' then ok:=False;
      end;
   end;
   if ok then LabeledEdit1.Color:=clDefault
   else LabeledEdit1.Color:=clRed;
end;



procedure TForm1.Button1Click(Sender: TObject);
var fil:Textfile;
  sl,newsl:TStringList;
  acceptable_list:Array[1..41] of string;
  line,savedline,str,path,fold,lineminus1,lineminus2,lineminus3:string; // single line of a dxf file
  res,fileext:TArrayOfString; //used for SplitString function output
  org_cur_line,new_current_line,norm_line,current_line,start_line,text_per_item,i,j,k,col_id,col_x,col_y,col_c,col_z,col_mat,col_fp,col_dir,col_diro,col_vdi,min_in_col,si,old_count,start_pos,maxtables,maxline:integer;
  start_defined,assign_columns_done,table_done,col_count_found,is_acceptable,alternate_method,nextlineid,plkp20z:boolean;
  ust:TIniFile;
begin
    ProgressBar1.Position:=0;
    offset:=0;
    ListBox1.Clear;
    ListBox2.Clear;
    ListBox3.Clear;
    ListBox4.Clear;
    ListBox5.Clear;
    ListBox6.Clear;
    ListBox7.Clear;
    ListBox8.Clear;
    ListBox9.Clear;
    ListBox11.Clear;
    ListBox13.Clear;
    Form2.CheckListBox1.Clear;
    Form2.ListBox1.Clear;
    if length(OpenDialog1.Filename)>3 then begin  // open file dialog, show error if no file is selected
     maxtables:=0;
     maxline:=0;
     AssignFile(fil,OpenDialog1.FileName); //dxf file choosen by user
    reset(fil);
    repeat //find out number of eroding tables in file
    lineminus3:=lineminus2;
    lineminus2:=lineminus1;
    lineminus1:=line;
    readln(fil,line);
    if AnsiContainsStr(line,'Electrodes are used for the following parts') then inc(maxtables);
    if AnsiContainsStr(line,'Elektroden werden fuer folgende Teile verwendet') then inc(maxtables);
    if AnsiContainsStr(line,'Elektroden werden für folgende Teile verwendet') then inc(maxtables);
    if AnsiContainsStr(line,'Elektroden werden fur folgende Teile verwendet') then inc(maxtables);
    if (length(lineminus1)=2) then begin // find out ai number
       if isNumeric(lineminus1) then begin
          //dxf
          if (lineminus2='  1') then begin
             if (line='  7') then begin
                if (lineminus3='     1') then begin
                   if (((strtoint(Edit16.Text)+1)=strtoint(lineminus1)) or (Edit6.Text='00')) then begin
                      //showmessage(lineminus3+AnsiString(#13#10)+lineminus2+AnsiString(#13#10)+lineminus1+AnsiString(#13#10)+line); //debug
                      Edit16.Text:=lineminus1;
                   end;
                end;
             end;
          end;
          //mi
          if (lineminus2='1') then begin
             if (line='0') then begin
                if (lineminus3='0') then begin
                   if (((strtoint(Edit16.Text)+1)=strtoint(lineminus1)) or (Edit6.Text='00')) then begin
                      //showmessage(lineminus3+AnsiString(#13#10)+lineminus2+AnsiString(#13#10)+lineminus1+AnsiString(#13#10)+line); //debug
                      Edit16.Text:=lineminus1;
                   end;
                end;
             end;
          end;
       end;
    end;
    inc(maxline);
    until eof(fil);
    CloseFile(fil);
    Label15.Caption:='/ '+inttostr(maxtables);
    fileext:=SplitString('.',OpenDialog1.FileName);
    if CheckBox2.Checked=True then begin // reverse the dxf
       sl:=TStringList.Create;  //oop bullshit
       newsl:=TStringList.Create;  //oop bullshit
       sl.LoadFromFile(OpenDialog1.FileName); //load dxf into stringlist
       for si:=(sl.Count-1) downto 1 do newsl.Add(sl.Strings[si]); //reverse the stringlist
       sl.Destroy;
       newsl.SaveToFile(Application.Location+'temp.'+fileext[(length(fileext)-1)]); //save reversed stringlist to temp file
       newsl.Destroy;
       AssignFIle(fil,Application.Location+'temp.'+fileext[(length(fileext)-1)]); //use the temp file instead of the original dxf
    end
    else AssignFile(fil,OpenDialog1.FileName); //dxf file choosen by user
    reset(fil);                 //ensure reading from begining of the file
    current_line:=0;            //pre-set all varribles
    start_line:=0;
    start_defined:=False;       //dxf reading stage for "electrodes used for..."
    assign_columns_done:=False;  //dxf reading stage for first row of table
    table_done:=False;            //dxf reading stage for end table
    alternate_method:=False;
    nextlineid:=False;
    plkp20z:=False;           // special case indicator for certain kind of dxf made by 1 person with bad CREO configuration
    col_count_found:=False;  //reset this to allow tables of different column amount in the same dxf
    if LowerCase(fileext[(length(fileext)-1)])='dxf' then text_per_item:=30 // TODO: possibly change this to be readed from dxf file itself, it may vary
    else if LowerCase(fileext[(length(fileext)-1)])='mi' then text_per_item:=34
    else ShowMessage('FileType Error!');
    ProgressBar1.Position:=10;
    repeat
      if length(line)=7 then savedline:=line;
      readln(fil,line);  //read 1 line
      inc(current_line);  //increase counter for line number
      if current_line>=end_table_line then begin // discarrd line numbers lower than start position, for second table
         if start_defined=False then res:=SplitString(':',line);
         if length(line)>=1 then begin //to avoid crashing on empty lines
            if start_defined=False then if (((trim(res[0])='Electrodes are used for the following parts') or (trim(res[0])='Elektroden werden fuer folgende Teile verwendet') or (trim(res[0])='Elektroden werden für folgende Teile verwendet') or (trim(res[0])='Elektroden werden f\U+00fcr folgende Teile verwendet') or (trim(res[0])='Elektroden werden fur folgende Teile verwendet')) and (length(res[1])>=6)) then begin //find start of position table

               //if (length(res[1])<=6) then begin
               //   res[1]:=trim(savedline);
               //   nextlineid:=True;
               //end;
               Edit3.Text:=LeftStr(trim(res[1]),7); //save part number (turncate to prevent rare cases of long texi in this line)
               start_line:=current_line; //define starting point of position table
               if plsr12sc=True then start_line:=start_line+6;
               start_defined:=True;
               ProgressBar1.Position:=20;
            end;
            if start_defined=True then begin
               if col_count_found=False then begin //try to find first electrode name, in order to determine no of columns
                  for i:=1 to 15 do if current_line=(start_line+(i*text_per_item)) then begin
                      if trim(line)='Z' then plkp20z:=True;
                      if (((length(trim(line))=7) and (isNumber(trim(line)))) or (AnsiContainsStr(trim(line),'EL-FR'))) then begin
                            col_count_found:=True;
                            org_cur_line:=current_line;
                            SpinEdit1.Value:=(((current_line-start_line) div text_per_item)-1); //save found table width
                            if plkp20z=True then SpinEdit1.Value:=SpinEdit1.Value-1;
                            reset(fil);
                            new_current_line:=0;
                            for j:=1 to (current_line-(text_per_item*SpinEdit1.Value)) do begin //go back to the line of table start
                                inc(new_current_line);
                                readln(fil,line);
                            end;
                            current_line:=new_current_line;
                      end;
                   end;
               end;
               if col_count_found=true then begin
               acceptable_list[1]:='ID no. for electrode';
               acceptable_list[2]:='X';
               acceptable_list[3]:='Y';
               acceptable_list[4]:='Angle of rotation';
               acceptable_list[5]:='Countersink depth';
               acceptable_list[6]:='Electrode material';
               acceptable_list[7]:='Height';
               acceptable_list[8]:='Workpiece surface';
               acceptable_list[9]:='U1';
               acceptable_list[10]:='U2';
               acceptable_list[11]:='Proj. face';
               acceptable_list[12]:='Eroding direction';
               acceptable_list[13]:='ID-NR';
               acceptable_list[14]:='ELEKTR-NUMMER';
               acceptable_list[15]:='Id-Nr Elektrode';
               acceptable_list[16]:='TIEFE';
               acceptable_list[17]:='WINKEL';
               acceptable_list[18]:='Drehwinkel';
               acceptable_list[19]:='Senktiefe';
               acceptable_list[20]:='Elektrodenwerkstoff';
               acceptable_list[21]:='Erodierrichtung';
               acceptable_list[22]:='Oberflaeche Werkstueck';
               acceptable_list[23]:='Proj. Flaeche';
               acceptable_list[24]:='Auslenkmethode';
               acceptable_list[25]:='Z';  //special case for some of plkp20 drawings
               acceptable_list[26]:='Excursion method';
               acceptable_list[27]:='Auslenkmethode';
               acceptable_list[28]:='Oberfläche Werkstück';  //vdi
               acceptable_list[29]:='Proj. Fläche';
               acceptable_list[30]:='Length'; //plgd special case
               acceptable_list[31]:='Width'; //not seen on real drawings, just in case
               acceptable_list[32]:='Positioning path';  //Creo option, not seen in real drawings
               acceptable_list[33]:='Erodierr.';
               acceptable_list[34]:='Id-Nr El.';
               acceptable_list[35]:='Obfl. Werkst.';  //vdi
               acceptable_list[36]:='El.-Werkst.';
               acceptable_list[37]:='Laenge';
               acceptable_list[38]:='Breite';
               acceptable_list[39]:='Hoehe';
               acceptable_list[40]:='Positionierstrecke';
               acceptable_list[41]:='bugfix_nons';

               i:=0;
               if ListBox1.Count<SpinEdit1.Value then repeat
                 inc(i);
               if (current_line=(start_line+(i*text_per_item)+offset)) then begin //every read 10 values, every 30 lines
                  is_acceptable:=False;
                  for j:=1 to length(acceptable_list) do if trim(line)=acceptable_list[j] then is_acceptable:=True;
                  //showmessage(line);
                  if is_acceptable=False then begin  //special case for some of plkk44 drawings
                     for k:=1 to 6 do begin
                         inc(offset);
                         readln(fil,line);
                     end
                  end;

                  //if offset<>0 then SpinEdit1.Value:=((((SpinEdit1.Value*text_per_item)-offset) div text_per_item)-1);
                  is_acceptable:=False;
                  for j:=1 to length(acceptable_list) do begin
                           if trim(line)=acceptable_list[j] then begin
                   is_acceptable:=True;
                  end
                  else begin
                      end;
                  end;
                  if is_acceptable=True then if trim(line)<>'Z' then ListBox1.Items.Add(line); //add those lines to listbox
                  //break;
               end;
               if ((((length(trim(line))=7) and (isNumber(trim(line))))) or (AnsiContainsStr(trim(line),'EL-FR'))) then begin
                  if offset<>0 then begin
                     SpinEdit1.Value:=SpinEdit1.Value-1;
                     ListBox2.Items.Add(trim(line));
                  end;
                  break;

               end;
               until i>SpinEdit1.Value;
               if (assign_columns_done=True and table_done=False) then begin
               //read actual data
               if ((offset=0) and (alternate_method=False)) then begin
                   if ((current_line-start_line) mod text_per_item)=0 then begin //only lines containing data
                      norm_line:=((current_line-start_line) div text_per_item); //normalized line number
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_id then ListBox2.Items.Add(trim(line));  //add items to appropriate listboxes
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_x then ListBox3.Items.Add(trim(line));
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_y then ListBox4.Items.Add(trim(line));
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_c then ListBox5.Items.Add(trim(line));
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_z then ListBox6.Items.Add(trim(line));
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_mat then ListBox7.Items.Add(trim(line));
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_fp then ListBox8.Items.Add(trim(line));
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_dir then ListBox9.Items.Add(trim(line));
                      if ((norm_line-1) mod (SpinEdit1.Value))=col_vdi then ListBox12.Items.Add(trim(line));

                   end;
                   if (((line='ENDBLK')or (line='LIN')) and (current_line>(start_line+200))) then begin  // magic number 200 :( its to be sure to not exceen length of table
                      //showmessage('current_line: '+inttostr(current_line)+', start_line: '+inttostr(start_line)+', line: '+line);  //debug message
                      table_done:=True;  //do not continue after this
                      end_table_line:=(current_line+1); //start line to search for next table
                      ProgressBar1.Position:=40;
                   end;
                   end
                   else begin
                        //TODO the strange dxf files with varrible distances between important lines
                        SpinEdit1.Value:=(((SpinEdit1.Value*text_per_item)-offset) div text_per_item);
                        current_line:=current_line+offset;
                        offset:=0;
                        alternate_method:=True;
                        //WILL NOT FIX - NO SOLUTION - OPEN .DXF AND SAVE AS .MI AND IT WILL WORK
                        // Or generate new table form 3D
                        // or use SEB
                   end;
               end;
               if ListBox1.Count>=SpinEdit1.Value then if assign_columns_done=False then begin //assign columns when all read, if not already done
                  //pre-set varribles to 9999 - means no column present
                  col_id:=9999;
                  col_x:=9999;
                  col_y:=9999;
                  col_z:=9999;
                  col_c:=9999;
                  col_mat:=9999;
                  col_fp:=9999;
                  col_dir:=9999;
                  col_diro:=9999;
                  col_vdi:=9999;
                  for i:=0 to (SpinEdit1.Value-1) do begin //read every item
                      case ListBox1.Items[i] of  //and check for every needed column name
                           'ID no. for electrode': col_id:=i;
                           'X': col_x:=i;
                           'Y': col_y:=i;
                           'Angle of rotation': col_c:=i;
                           'Countersink depth': col_z:=i;
                           'Electrode material': col_mat:=i;
                           'Proj. face': col_fp:=i;
                           'ID-NR': col_id:=i; //german
                           'ELEKTR-NUMMER': col_id:=i; //german alt
                           'Id-Nr Elektrode': col_id:=i; //german alt
                           'Id-Nr El.': col_id:=i;
                           'TIEFE': col_z:=i; //german
                           'WINKEL': col_c:=i; //german
                           'Drehwinkel': col_c:=i; //german alt
                           'Senktiefe': col_z:=i; //german alt
                           'Elektrodenwerkstoff': col_mat:=i; //german
                           'El.-Werkst.': col_mat:=i;
                           'Eroding direction': col_dir:=i;
                           'Proj. Flaeche': col_fp:=i;
                           'Proj. Fläche': col_fp:=i;
                           'Erodierrichtung': col_dir:=i;
                           'Erodierr.': col_dir:=i;
                           'Workpiece surface': col_vdi:=i;
                           'Oberflaeche Werkstueck': col_vdi:=i;
                           'Oberfläche Werkstück': col_vdi:=i;
                           'Obfl. Werkst.': col_vdi:=i;
                      end;
                  end;
                  assign_columns_done:=True; //only do this once per table
                  ProgressBar1.Position:=30;
               end;
               end; // col count found=true
            end; //start defined=true
         end;  //length of line >1
      end; //current line>= end table line
    until eof(fil);
    CloseFile(fil);
    ProgressBar1.Position:=50;
    //evaluation of data
    ProgressBar1.Position:=60;
    //delete additional things (for reverse order)
    if ListBox2.Count>0 then begin
       start_pos:=0;
       i:=0;
       repeat
         //showmessage(inttostr(length(ListBox2.Items[i])));
       if ((length(ListBox2.Items[i])<>7) and (not (AnsiContainsStr(ListBox2.Items[i],'EL-FR')))) then start_pos:=i;  // 28-06-17 bugfix (added 'not')
       //showmessage(inttostr(i));
       inc(i);
       until ((start_pos>0) or (i>=ListBox2.Count));
       if start_pos=0 then start_pos:=ListBox2.Count;
       //showmessage(inttostr(start_pos));
       old_count:=ListBox2.Count-1;
       if (ListBox2.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox2.Items.Delete(j);
       old_count:=ListBox3.Count-1;
       if (ListBox3.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox3.Items.Delete(j);
       old_count:=ListBox4.Count-1;
       if (ListBox4.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox4.Items.Delete(j);
       old_count:=ListBox6.Count-1;
       if (ListBox6.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox6.Items.Delete(j);
    end;
    if ((ListBox7.Count=0) and (col_mat=9999)) then for i:=0 to (ListBox2.Count-1) do ListBox7.Items.Add('Graphite2'); //in case material was not in dxf table
    if ((ListBox8.Count=0) and (col_fp=9999)) then for i:=0 to (ListBox2.Count-1) do ListBox8.Items.Add('0'); // in case fp was not in dxf table
    if ((ListBox5.Count=0) and (col_c=9999)) then for i:=0 to (ListBox2.Count-1) do ListBox5.Items.Add('0');  // in case C was not in dxf table
    if ((ListBox9.Count=0) and (col_dir=9999)) then for i:=0 to (ListBox2.Count-1) do ListBox9.Items.Add('Z'); // in case eroding direction was not in dxf table
    if ((ListBox11.Count=0) and (col_diro=9999)) then for i:=0 to (ListBox2.Count-1) do ListBox11.Items.Add('5'); // in case eroding direction was not in dxf table
    if ((ListBox12.Count=0) and (col_vdi=9999)) then for i:=0 to (ListBox2.COunt-1) do ListBox12.Items.Add('VDI26'); //change this to respect user choice
    if ListBox2.Count>0 then begin
       old_count:=ListBox5.Count-1;
       if (ListBox5.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox5.Items.Delete(j);
       old_count:=ListBox7.Count-1;
       if (ListBox7.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox7.Items.Delete(j);
       old_count:=ListBox8.Count-1;
       if (ListBox8.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox8.Items.Delete(j);
       old_count:=ListBox9.Count-1;
       if (ListBox9.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox9.Items.Delete(j);
       old_count:=ListBox12.Count-1;
       if (ListBox12.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox12.Items.Delete(j);
    end;
    ProgressBar1.Position:=70;
    setChanged(True);
    logToFile('loaded file '+OpenDialog1.FileName,'INF');
    if length(Edit3.Text)<2 then begin
       inc(errorlevel);
       logToFile('wrong file - no table header found. errorlevel='+inttostr(errorlevel),'ERR');
    end
    else begin
         if ((ListBox2.Count>0) and (ListBox2.Count=ListBox3.Count)) then begin
         inc(tableno);
         Label14.Caption:=inttostr(tableno);
        end;
    end;
    end //no file selected
    else if ((plsr12sc=True) and (CheckBox2.Checked=True)) then begin
         logToFile('no file selected','ERR');
         ShowMessage('Nie wybrano pliku');
    end;
    if alternate_method=true then logToFile('error - file uses varrible string distance','ERR');
    if ListBox1.Count=0 then begin
       if plsr12sc=False then begin
        plsr12sc:=True;
        end_table_line:=0;
        Button1.Click;
        end
        else if (CheckBox2.Checked=False) then begin
          CheckBox2.Checked:=True;
          end_table_line:=0;
          plsr12sc:=False;
          Button1.Click;
        end;
    end
    else if ((ListBox1.Items[0]<>'ID no. for electrode') and (ListBox1.Items[0]<>'ID-NR') and (ListBox1.Items[0]<>'ELEKTR-NUMMER') and (ListBox1.Items[0]<>'Id-Nr Elektrode') and (ListBox1.Items[0]<>'Id-Nr El.')) then begin //no valid table found
         if CheckBox2.Checked=False then begin
            CheckBox2.Checked:=True; //check button for reversing dxf file
            end_table_line:=0;
            Button1.Click; //run search for table again
         end
         else begin
             logToFile('EOF, no table','ERR');
             ShowMessage('Koniec pliku, nie znaleziono tabeli!');
         end;
    end
    else if ListBox1.Count=0 then begin
       logToFile('error - no table detected','ERR');
     ShowMessage('Nie wykryto tabeli z pozycjami elektrod w pliku '+OpenDialog1.FileName);
     end;
     if errorlevel>3 then begin
      inc(gel); //global error level
      errorlevel:=0;
     end;
     if gel>3 then ShowMessage('Niepoprawny plik DXF! '+inttostr(errorlevel));

    // check if such program already exists.
    ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   path:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
   fold:=ust.ReadString('settings','createFolder','1');
   if fold='1' then Label17.Visible:=directoryExists(path+'\'+Edit3.Text);
   ust.Free;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var i,j,ik,iw:integer;
  sx,sy,ko,kd:real;
begin
 //copies of selected row
  If ListBox2.ItemIndex>=0 then begin
      if Form7.ShowModal = mrOK then begin
         setChanged(true);
          if Form7.RadioButton1.Checked then begin  //pojedyncza kopia
             logTofile('single copy '+ListBox2.Items[ListBox2.ItemIndex],'INF');
             ListBox2.Items.Add(ListBox2.Items[ListBox2.ItemIndex]);
             ListBox3.Items.Add(floattostr(strtofloat(ListBox3.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit1.Text)));  //x
             ListBox4.Items.Add(floattostr(strtofloat(ListBox4.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit2.Text)));  //y
             ListBox5.Items.Add(floattostr(strtofloat(ListBox5.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit4.Text)));  //c
             ListBox6.Items.Add(floattostr(strtofloat(ListBox6.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit3.Text)));  //z
             ListBox7.Items.Add(ListBox7.Items[ListBox2.ItemIndex]);
             ListBox8.Items.Add(ListBox8.Items[ListBox2.ItemIndex]);
             ListBox9.Items.Add(ListBox9.Items[ListBox2.ItemIndex]);
             ListBox11.Items.Add(ListBox11.Items[ListBox2.ItemIndex]);
             ListBox12.Items.Add(ListBox12.Items[ListBox2.ItemIndex]);

          end
          else if Form7.RadioButton2.Checked then begin //liniowy
             ik:=strtoint(Form7.LabeledEdit4.Text);
             if ik<1 then ik:=2;
             if ik>99 then ik:=99;
             logTofile('linear copy '+ListBox2.Items[ListBox2.ItemIndex]+' ('+inttostr(ik)+')','INF');
             for i:=1 to ik do begin
                ListBox2.Items.Add(ListBox2.Items[ListBox2.ItemIndex]);
                ListBox3.Items.Add(floattostr(strtofloat(ListBox3.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit1.Text)*i));  //x
                ListBox4.Items.Add(floattostr(strtofloat(ListBox4.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit2.Text)*i));  //y
                ListBox5.Items.Add(floattostr(strtofloat(ListBox5.Items[ListBox2.ItemIndex])));  //c
                ListBox6.Items.Add(floattostr(strtofloat(ListBox6.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit3.Text)*i));  //z
                ListBox7.Items.Add(ListBox7.Items[ListBox2.ItemIndex]);
                ListBox8.Items.Add(ListBox8.Items[ListBox2.ItemIndex]);
                ListBox9.Items.Add(ListBox9.Items[ListBox2.ItemIndex]);
                ListBox11.Items.Add(ListBox11.Items[ListBox2.ItemIndex]);
                ListBox12.Items.Add(ListBox12.Items[ListBox2.ItemIndex]);
             end;
          end
          else if Form7.RadioButton3.Checked then begin  //macierz
             iw:=strtoint(Form7.LabeledEdit3.Text);
             ik:=strtoint(Form7.LabeledEdit4.Text);
             logTofile('matrix copy '+ListBox2.Items[ListBox2.ItemIndex]+' ( '+inttostr(iw)+' x '+inttostr(ik)+' )','INF');
               for i:=1 to iw do begin
                  for j:=1 to ik do begin
                     if ((i<>1) and (j<>1)) then begin
                         ListBox2.Items.Add(ListBox2.Items[ListBox2.ItemIndex]);
                         ListBox3.Items.Add(floattostr(strtofloat(ListBox3.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit1.Text)*j));  //x
                         ListBox4.Items.Add(floattostr(strtofloat(ListBox4.Items[ListBox2.ItemIndex])+strtofloat(Form7.LabeledEdit2.Text)*i));  //y
                         ListBox5.Items.Add(floattostr(strtofloat(ListBox5.Items[ListBox2.ItemIndex])));  //c
                         ListBox6.Items.Add(floattostr(strtofloat(ListBox6.Items[ListBox2.ItemIndex])));  //z
                         ListBox7.Items.Add(ListBox7.Items[ListBox2.ItemIndex]);
                         ListBox8.Items.Add(ListBox8.Items[ListBox2.ItemIndex]);
                         ListBox9.Items.Add(ListBox9.Items[ListBox2.ItemIndex]);
                         ListBox11.Items.Add(ListBox11.Items[ListBox2.ItemIndex]);
                         ListBox12.Items.Add(ListBox12.Items[ListBox2.ItemIndex]);
                     end;
                  end;
               end;
          end
          else if Form7.RadioButton4.Checked then begin //kolowy
                 sx:=strtofloat(Form7.LabeledEdit1.Text);
                 sy:=strtofloat(Form7.LabeledEdit2.Text);
                 ko:=strtofloat(Form7.LabeledEdit3.Text);
                 kd:=strtofloat(Form7.LabeledEdit4.Text);
                 ik:=strtoint(Form7.LabeledEdit5.Text);
                 logTofile('circular copy '+ListBox2.Items[ListBox2.ItemIndex]+' ('+inttostr(ik)+')','INF');
                 for i:=1 to ik do begin
                    ListBox2.Items.Add(ListBox2.Items[ListBox2.ItemIndex]);
                    ListBox3.Items.Add(floattostr(RoundTo((strtofloat(ListBox3.Items[ListBox2.ItemIndex])-sx)*cos(DegToRad(ko*i))-(strtofloat(ListBox4.Items[ListBox2.ItemIndex])-sy)*sin(DegToRad(ko*i))+sx,4)));
                    ListBox4.Items.Add(floattostr(RoundTo((strtofloat(ListBox3.Items[ListBox2.ItemIndex])-sx)*sin(DegToRad(ko*i))+(strtofloat(ListBox4.Items[ListBox2.ItemIndex])-sy)*cos(DegToRad(ko*i))+sy,4)));
                    ListBox5.Items.Add(floattostr(strtofloat(ListBox5.Items[ListBox2.ItemIndex])+kd*i));
                    ListBox6.Items.Add(floattostr(strtofloat(ListBox6.Items[ListBox2.ItemIndex])));  //z
                     ListBox7.Items.Add(ListBox7.Items[ListBox2.ItemIndex]);
                     ListBox8.Items.Add(ListBox8.Items[ListBox2.ItemIndex]);
                     ListBox9.Items.Add(ListBox9.Items[ListBox2.ItemIndex]);
                     ListBox11.Items.Add(ListBox11.Items[ListBox2.ItemIndex]);
                     ListBox12.Items.Add(ListBox12.Items[ListBox2.ItemIndex]);
                 end;

          end;
      end;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var di:integer;
begin
   if ListBox2.ItemIndex>=0 then begin
      di:=ListBox2.ItemIndex;
      logToFile('deleted line (id:'+ListBox2.Items[di]+', x:'+ListBox3.Items[di]+', y:'+ListBox4.Items[di]+', z:'+ListBox6.Items[di]+', c:'+ListBox5.Items[di]+')','INF');
      ListBox2.Items.Delete(di);
      ListBox3.Items.Delete(di);
      ListBox4.Items.Delete(di);
      ListBox5.Items.Delete(di);
      ListBox6.Items.Delete(di);
      ListBox7.Items.Delete(di);
      ListBox8.Items.Delete(di);
      ListBox9.Items.Delete(di);
      ListBox11.Items.Delete(di);
      ListBox12.Items.Delete(di);
      if ((di=0) and (ListBox2.Items.Count>0)) then ListBox2.ItemIndex:=di;
      ListBox2.ItemIndex:=di-1;

      ListBox3.ItemIndex:=ListBox2.ItemIndex;
      ListBox4.ItemIndex:=ListBox2.ItemIndex;
      ListBox5.ItemIndex:=ListBox2.ItemIndex;
      ListBox6.ItemIndex:=ListBox2.ItemIndex;
      ListBox7.ItemIndex:=ListBox2.ItemIndex;
      ListBox8.ItemIndex:=ListBox2.ItemIndex;
      ListBox9.ItemIndex:=ListBox2.ItemIndex;
      ListBox11.ItemIndex:=ListBox2.ItemIndex;
      ListBox12.ItemIndex:=ListBox2.ItemIndex;

      setChanged(true);
   end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var di:integer;
  logg:string;
begin
 if ListBox2.ItemIndex>=0 then begin
    di:=ListBox2.ItemIndex;
    logg:='changed line (';
    logg:=logg+'id: '+ListBox2.Items[di]+' -> '+Edit1.Text+', ';
    if ListBox3.Items[di] <> Edit2.Text then logg:=logg+'X: '+ListBox3.Items[di]+' -> '+Edit2.Text+', ';
    if ListBox4.Items[di] <> Edit4.Text then logg:=logg+'Y: '+ListBox4.Items[di]+' -> '+Edit4.Text+', ';
    if ListBox5.Items[di] <> Edit5.Text then logg:=logg+'C: '+ListBox5.Items[di]+' -> '+Edit5.Text+', ';
    if ListBox6.Items[di] <> Edit6.Text then logg:=logg+'Z: '+ListBox6.Items[di]+' -> '+Edit6.Text+', ';
    if ListBox7.Items[di] <> elmatii_output(ComboBox5.ItemIndex) then logg:=logg+'mat: '+ListBox7.Items[di]+' -> '+elmatii_output(ComboBox5.ItemIndex)+', ';
    if ListBox8.Items[di] <> Edit8.Text then logg:=logg+'fp: '+ListBox8.Items[di]+' -> '+Edit8.Text+', ';
    if ListBox9.Items[di] <> Edit9.Text then logg:=logg+'dirb: '+ListBox9.Items[di]+' -> '+Edit9.Text+', ';
    if ListBox11.Items[di] <> Edit10.Text then logg:=logg+'odsb: '+ListBox11.Items[di]+' -> '+Edit10.Text+', ';
    logg:=logg+')';
    logToFile(logg,'INF');
   ListBox2.Items[di]:=Edit1.Text;
   ListBox3.Items[di]:=Edit2.Text;
   ListBox4.Items[di]:=Edit4.Text;
   ListBox5.Items[di]:=Edit5.Text;
   ListBox6.Items[di]:=Edit6.Text;
   ListBox7.Items[di]:=elmatii_output(ComboBox5.ItemIndex);
   ListBox8.Items[di]:=Edit8.Text;
   ListBox9.Items[di]:=Edit9.Text;
   ListBox11.Items[di]:=Edit10.Text;
   ListBox12.Items[di]:=vdi_ii_to_nr(ComboBox3.ItemIndex);
   setChanged(true);
 end;
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
 if length(Edit1.Text)>0 then begin
   logToFile('line added manually to the table (el:'+Edit1.Text+', X:'+Edit2.Text+', Y:'+Edit4.Text+', C:'+Edit5.Text+', Z:'+Edit6.Text+', mat: '+elmatii_output(COmboBox5.ItemIndex)+', Fp: '+Edit8.Text+', dir: '+Edit9.Text+', ods: '+Edit10.Text+', vdi: '+vdi_ii_to_nr(ComboBox3.ItemIndex)+')','INF');
    ListBox2.Items.Add(Edit1.Text);
    ListBox3.Items.Add(Edit2.Text);
    ListBox4.Items.Add(Edit4.Text);
    ListBox5.Items.Add(Edit5.Text);
    ListBox6.Items.Add(Edit6.Text);
    ListBox7.Items.Add(elmatii_output(ComboBox5.ItemIndex));
    ListBox8.Items.Add(Edit8.Text);
    ListBox9.Items.Add(Edit9.Text);
    ListBox11.Items.Add(Edit10.Text);
    ListBox12.Items.Add(vdi_ii_to_nr(ComboBox3.ItemIndex));
    setChanged(true);
 end;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
  Button14Click(Form1);
end;

procedure TForm1.BitBtn6Click(Sender: TObject);
var i,j,k,ci:integer;
  orb,rfp,rmulti,rmat,rdir:string;
  elv:TArrayOfString;
  us:Array[1..4] of string;
  usi:Array[1..4] of integer;
  fcsv:TextFile;
  c180:real;
  ust:TIniFile;
begin
 if Form2.Label13.Caption='done' then begin
    SaveDialog2.FileName:='erodieren_'+Edit3.Text+'.csv';
    ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    SaveDialog2.InitialDir:=ust.ReadString('settings','pathCSVexport','C:\Windows');
    ust.Free;
    if SaveDialog2.Execute then begin //if file selected
       AssignFile(fcsv,SaveDialog2.FileName);
       rewrite(fcsv);
       writeln(fcsv,'Beschreibung Werkstueck');
       writeln(fcsv,'NAME; PIECE_WIDTH; PIECE_LENGTH; PIECE_HEIGHT; MATR; X; Y');
       writeln(fcsv,Edit3.Text+';51.700000000000003;6.2300000000000004;33.0;'+ComboBox4.Items[ComboBox4.ItemIndex]);
       writeln(fcsv,'generated;dxf2agiehp');
       writeln(fcsv,'Beschreibung Elektrode');
       writeln(fcsv,'NAME;');
       for i:=0 to ListBox2.Count-1 do begin //for every electrode position
           for j:=1 to 4 do us[j]:='0';
           for j:=1 to 4 do usi[j]:=0;
           for j:=0 to Form2.ListBox1.Count-1 do begin //for every electrode
               elv:=SplitString(';',Form2.ListBox1.Items[j]);
               if elv[0]=Form1.ListBox2.Items[i] then begin  //if name matches

                  ci:=1;
                  orb:=elv[19]; //save selected type of bottom shape
                  rfp:=elv[2];  //save selected fp
                  rmulti:=elv[16];
                  rmat:=elv[1];

                  {  old method
                  us[ci]:=elv[3]; // u1 electrode always present
                  inc(usi[ci]);
                  for k:=4 to 8 do begin // u2 to u6
                    if elv[k]<>'0' then begin
                       if elv[k]=us[ci] then inc(usi[ci]) //increase number if the same undersize
                       else begin
                            inc(ci);  //move to new undersize
                            us[ci]:=elv[k];
                            inc(usi[ci]);
                            if ci>4 then logToFile('Too many undersize types! (el '+elv[0],'ERR');
                       end;
                    end;
                  end; }
                  //use magpos as number of electrodes
                  us[1]:=elv[3];
                  us[2]:=elv[4];
                  us[3]:=elv[5];
                  us[4]:=elv[6];
                  usi[1]:=strtoint(elv[9]);
                  usi[2]:=strtoint(elv[10]);
                  usi[3]:=strtoint(elv[11]);
                  usi[4]:=strtoint(elv[12]);
               end;
            //else ShowMessage(elv[0]+' - '+Form1.ListBox2.Items[i]);
           end;

           case ListBox9.Items[i] of
                'X+': rdir:='+X';
                '+X': rdir:='+X';
                'X-': rdir:='-X';
                '-X': rdir:='-X';
                'Y+': rdir:='+Y';
                '+Y': rdir:='+Y';
                'Y-': rdir:='-Y';
                '-Y': rdir:='-Y';
                else rdir:='Z';
           end;

           //Save 1 line in CSV
           if CheckBox7.Checked then c180:=strtofloat(ListBox5.Items[i])
           else c180:=roundto(strtofloat(ListBox5.Items[i])+180,4);
           if c180>=360 then c180:=c180-360;
           writeln(fcsv,ListBox2.Items[i]+';20;10;50;'+ListBox3.Items[i]+';'+ListBox4.Items[i]+';'+floattostr(c180)+';'+rdir+';'+ListBox6.Items[i]+';'+ListBox12.Items[i]+';'+rmat+';'
                        +rfp+';'+inttostr(usi[1])+';'+us[1]+';'+inttostr(usi[2])+';'+us[2]+';'+inttostr(usi[3])+';'+us[3]+';'+inttostr(usi[4])+';'+us[4]+';'+orb+';0.0000;-;;;;;true;false');
           if rmulti='1' then begin  //simulate AgieVision's Mult Electrode by adding another sparking position
              logToFile('added multielectrode for HMI','INF');
              c180:=c180+180;
              if c180>=360 then c180:=c180-360;
              writeln(fcsv,ListBox2.Items[i]+';20;10;50;'+ListBox3.Items[i]+';'+ListBox4.Items[i]+';'+floattostr(c180)+';'+rdir+';'+ListBox6.Items[i]+';'+ListBox12.Items[i]+';'+rmat+';'
                        +rfp+';'+inttostr(usi[1])+';'+us[1]+';'+inttostr(usi[2])+';'+us[2]+';'+inttostr(usi[3])+';'+us[3]+';'+inttostr(usi[4])+';'+us[4]+';'+orb+';0.0000;-;;;;;true;false');
           end;
       end;
       CloseFile(fcsv);
       logToFile('Saved CSV '+SaveDialog2.FileName,'OK');
       ShowMessage('Poprawnie zapisano '+SaveDialog2.FileName);
    end
    else ShowMessage('nie zapisano csv!');
 end
 else ShowMessage('Uzupełnij dane elektrod!');
end;

procedure TForm1.BitBtn7Click(Sender: TObject);
var i,j:integer;
begin
  if ListBox2.Items.Count>1 then begin
     logToFile('AZ sort','INF');
     for i:=1 to ListBox2.Items.Count-1 do begin
        for j:=0 to i-1 do begin
           if ListBox2.Items[i]<ListBox2.Items[j] then begin
               ListBox2.Items.Move(i,j);
               ListBox3.Items.Move(i,j);
               ListBox4.Items.Move(i,j);
               ListBox5.Items.Move(i,j);
               ListBox6.Items.Move(i,j);
               ListBox7.Items.Move(i,j);
               ListBox8.Items.Move(i,j);
               ListBox9.Items.Move(i,j);
               ListBox11.Items.Move(i,j);
               ListBox12.Items.Move(i,j);
           end;
        end;
     end;
  end;
end;

procedure TForm1.BitBtn8Click(Sender: TObject);
var i,j:integer;
begin
  if ListBox8.Items.Count>1 then begin
     logToFile('fp sort','INF');
     for i:=1 to ListBox8.Items.Count-1 do begin
        for j:=0 to i-1 do begin
           if strtofloat(ListBox8.Items[i])>strtofloat(ListBox8.Items[j]) then begin
               ListBox2.Items.Move(i,j);
               ListBox3.Items.Move(i,j);
               ListBox4.Items.Move(i,j);
               ListBox5.Items.Move(i,j);
               ListBox6.Items.Move(i,j);
               ListBox7.Items.Move(i,j);
               ListBox8.Items.Move(i,j);
               ListBox9.Items.Move(i,j);
               ListBox11.Items.Move(i,j);
               ListBox12.Items.Move(i,j);
           end;
        end;
     end;
  end;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
var xj:TextFile;
  fd:string;
  pieces,pval,rval,elv,relv,relv2,tl:TArrayOfString;
  i,j,k,countpp,el_n,aoe,global_aoe,gaoe2,elind,shape_nr:integer;
  pinf:Array[0..10] of string;
  einf:Array[0..200] of string;
  einf2:Array[0..200] of string;
  curz,magpos,mdet:string;
  do_this_el:boolean;
  oldx,oldy,oldc,newx,newy,newc,wpc,wpx,wpy,nwpx,nwpy:real;
begin
 global_aoe:=0;
  if Form2.Label13.Caption='done' then begin
     SaveDialog3.FileName:=Edit3.Text;
      if SaveDialog3.Execute then begin
          ProgressBar1.Max:=60;
          ProgressBar1.Min:=0;
          ProgressBar1.Position:=0;
          AssignFile(xj,SaveDialog3.FileName);
          rewrite(xj);
          writeln(xj,'<?xml version="1.0" encoding="windows-1252"?>');
          writeln(xj,'<Jobs>');
          writeln(xj,'  <Version>9.0.0</Version>');
          writeln(xj,'  <Futura>1</Futura>');
          writeln(xj,'  <Job Name="'+Edit3.Text+'">');
          writeln(xj,'    <Comment>'+Edit3.Text+'ai'+Edit16.Text+' -  '+Edit15.Text+'</Comment>');
          writeln(xj,'    <Type>1</Type>');
          writeln(xj,'    <FlushingOnAtStart>1</FlushingOnAtStart>');
          writeln(xj,'    <TankEmptyingAtEnd>1</TankEmptyingAtEnd>');
          writeln(xj,'    <FlushingOffAtEnd>1</FlushingOffAtEnd>');
          writeln(xj,'    <UnloadToolAtEnd>1</UnloadToolAtEnd>');
          writeln(xj,'    <UnloadPalletAtEnd>1</UnloadPalletAtEnd>');
          DateTimeToString(fd,'yyyy/mm/dd hh:nn:ss',Now);
          writeln(xj,'    <CreationDate>'+fd+'</CreationDate>');
          writeln(xj,'    <ModificationDate>'+fd+'</ModificationDate>');
          writeln(xj,'      <IsoHeader/>');
          writeln(xj,'      <IsoFooter/>');
          writeln(xj,'      <IsoGeneric/>');
          writeln(xj,'    <IsoGenerationDate>'+fd+'</IsoGenerationDate>');
          writeln(xj,'    <CoherenceModificationDate>'+fd+'</CoherenceModificationDate>');
          writeln(xj,'    <PartExpressSeq>-1</PartExpressSeq>');
          writeln(xj,'    <JobProfile></JobProfile>');
          writeln(xj,'    <JobWorkshop></JobWorkshop>');
          writeln(xj,'    <OneTJobType>0</OneTJobType>');
          writeln(xj,'    <OneTJobCavityType>0</OneTJobCavityType>');
          writeln(xj,'    <OneTJobEDMType>0</OneTJobEDMType>');
          writeln(xj,'    <OneTJobModelSource></OneTJobModelSource>');
          writeln(xj,'    <OneTJobUserSeq></OneTJobUserSeq>');
          writeln(xj,'    <ErrHisto></ErrHisto>');
          writeln(xj,'    <Certificat></Certificat>');
          writeln(xj,'    <WearPartType>0</WearPartType>');
          writeln(xj,'    <WearPartSetting>2</WearPartSetting>');
          writeln(xj,'    <PartExpressSeqSub>0</PartExpressSeqSub>');
          writeln(xj,'    <SimpliedISOGeneration>False</SimpliedISOGeneration>');
          writeln(xj,'    <WearPartPrioSeq>False</WearPartPrioSeq>');
          writeln(xj,'    <ToolCompensationActive>0</ToolCompensationActive>');
          writeln(xj,'    <SmartToolEnabled>False</SmartToolEnabled>');
          writeln(xj,'    <WearPartActivated>False</WearPartActivated>');
          writeln(xj,'    <FilterKeys></FilterKeys>');
          writeln(xj,'    <Pdf></Pdf>');
          writeln(xj,'    <HideISOInputDlg>False</HideISOInputDlg>');
          writeln(xj,'    <Pieces>');
          pieces:=SplitString(',',LabeledEdit1.Text);
          ProgressBar1.Position:=5;
          if OpenDialog3.Execute then begin
             countpp:=0;
              Memo1.Lines.LoadFromFile(OpenDialog3.FileName);
              for i:=0 to Memo1.Lines.Count-1 do begin
                  pval:=SplitString(',',Memo1.Lines[i]);
                  if pval[1]='W' then begin
                     inc(countpp);
                     pinf[(countpp-1)]:=pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15];
                  end;
              end;
          end;
          ProgressBar1.Position:=10;
          if length(pieces)<>countpp then ShowMessage('Niezgodność danych z preseta - detale ('+inttostr(length(pieces))+' ≠ '+inttostr(countpp)+')');
          for i:=0 to length(pieces)-1 do begin
              rval:=SplitString(';',pinf[i]);
              writeln(xj,'      <Piece N="'+inttostr(i+1)+'">');
              writeln(xj,'        <Name>'+Edit3.Text+':'+inttostr(i)+'</Name>');
              wpx:=strtofloat(rval[0]);
              wpy:=strtofloat(rval[1]);
              wpc:=strtofloat(rval[3]);
              nwpx:=roundto((wpx*cos(degtorad(-(wpc*(-1)))))-(wpy*sin(degtorad(-(wpc*(-1))))),3);
              nwpy:=roundto((wpx*sin(degtorad(-(wpc*(-1)))))+(wpy*cos(degtorad(-(wpc*(-1))))),3);
              writeln(xj,'        <X>'+floattostr(nwpx)+'</X>');
              writeln(xj,'        <Y>'+floattostr(nwpy)+'</Y>');
              writeln(xj,'        <Z>'+floattostr(strtofloat(rval[2])-strtofloat(Edit13.Text))+'</Z>');
              writeln(xj,'        <Rot>'+rval[3]+'</Rot>');
              writeln(xj,'        <HBac>'+inttostr(floor(strtofloat(rval[2]))+70)+'</HBac>'); //dielectric height
              writeln(xj,'        <Palette>0</Palette>');
              writeln(xj,'        <MagPos>'+pieces[i]+'</MagPos>');
              writeln(xj,'        <Mandrin>1</Mandrin>'); //chuck, always 1
              writeln(xj,'        <CreationDate>'+fd+'</CreationDate>');
              writeln(xj,'        <ModificationDate>'+fd+'</ModificationDate>');
              writeln(xj,'        <PartAxisA>0</PartAxisA>');
              writeln(xj,'        <PartAxisB>0</PartAxisB>');
              writeln(xj,'        <ChipID></ChipID>');
              writeln(xj,'        <Conop_Pos_X></Conop_Pos_X>');
              writeln(xj,'        <Conop_Pos_Y></Conop_Pos_Y>');
              writeln(xj,'        <Conop_Pos_Z></Conop_Pos_Z>');
              writeln(xj,'        <Conop_Pos_C></Conop_Pos_C>');
              writeln(xj,'        <Conop_RefCor_X>0</Conop_RefCor_X>');
              writeln(xj,'        <Conop_RefCor_Y>0</Conop_RefCor_Y>');
              writeln(xj,'        <Conop_RefCor_Z>0</Conop_RefCor_Z>');
              writeln(xj,'        <Conop_RefCor_C>0</Conop_RefCor_C>');
              writeln(xj,'        <Conop_ID>0</Conop_ID>');
              writeln(xj,'      </Piece>');
          end;
          writeln(xj,'    </Pieces>');
          ProgressBar1.Position:=20;
          writeln(xj,'    <Points>');

          shape_nr:=0;
          for i:=0 to ListBox2.Count-1 do begin
             do_this_el:=False;
             for j:=0 to Form2.CheckListBox1.Count-1 do begin
                 if ListBox2.Items[i]=Form2.CheckListBox1.Items[j] then begin
                      if Form2.CheckListBox1.Checked[j] then do_this_el:=True;
                 end;
             end;
             if do_this_el then begin
                inc(shape_nr);
              writeln(xj,'      <Point N="'+inttostr(shape_nr)+'">');
              writeln(xj,'        <X>'+ListBox3.Items[i]+'</X>');
              writeln(xj,'        <Y>'+ListBox4.Items[i]+'</Y>');
              writeln(xj,'        <Z>'+ListBox11.Items[i]+'</Z>'); //startpoint
              writeln(xj,'        <Rot>'+ListBox5.Items[i]+'</Rot>');
              writeln(xj,'        <FromDistance>'+ListBox11.Items[i]+'</FromDistance>');
              writeln(xj,'        <X0>'+ListBox3.Items[i]+'</X0>');
              writeln(xj,'        <Y0>'+ListBox4.Items[i]+'</Y0>');
              writeln(xj,'        <Z0>0</Z0>');
              writeln(xj,'        <AngleX>0</AngleX>');
              writeln(xj,'        <CavityType>1</CavityType>');
              writeln(xj,'        <Zf>0</Zf>');
              writeln(xj,'        <AngleZ>0</AngleZ>');
              writeln(xj,'        <CreationDate>'+fd+'</CreationDate>');
              writeln(xj,'        <ModificationDate>'+fd+'</ModificationDate>');
              writeln(xj,'        <AxisA>0</AxisA>');
              writeln(xj,'        <AxisB>0</AxisB>');
              writeln(xj,'        <SpecificCavity>0</SpecificCavity>');
              writeln(xj,'        <MCType>0</MCType>');
              writeln(xj,'        <MCD1></MCD1>');
              writeln(xj,'        <MCN1>0</MCN1>');
              writeln(xj,'        <MCD2></MCD2>');
              writeln(xj,'        <MCN2>0</MCN2>');
              writeln(xj,'        <MCR>0</MCR>');
              writeln(xj,'        <MCI>0</MCI>');
              writeln(xj,'        <MCJ>0</MCJ>');
              writeln(xj,'        <MCIndex>0</MCIndex>');
              writeln(xj,'        <MCSettingChain>0</MCSettingChain>');
              writeln(xj,'        <MCSettingAlternate>0</MCSettingAlternate>');
              writeln(xj,'        <Xf>0</Xf>');
              writeln(xj,'        <Yf>0</Yf>');
              writeln(xj,'      </Point>');
             end;
          end;
          writeln(xj,'    </Points>');
          ProgressBar1.Position:=30;
          writeln(xj,'    <Tools>');
          el_n:=1;
          gaoe2:=0;
          for i:=0 to Form2.ListBox1.Count-1 do begin //for every electrode
             if Form2.CheckListBox1.Checked[i] then begin
              elv:=SplitString(';',Form2.ListBox1.Items[i]);
              if elv[8]<>'0' then aoe:=6
              else if elv[7]<>'0' then aoe:=5
              else if elv[6]<>'0' then aoe:=4
              else if elv[5]<>'0' then aoe:=3
              else if elv[4]<>'0' then aoe:=2
              else aoe:=1;
              einf2[i]:='';
              for j:=1 to aoe do begin
                  if length(einf2[i])>0 then einf2[i]:=einf2[i]+',';
                  einf2[i]:=einf2[i]+inttostr(gaoe2+j);
              end;
              gaoe2:=gaoe2+aoe;
              if aoe=1 then einf[i]:=inttostr(global_aoe+1)
             else if aoe=2 then einf[i]:=inttostr(global_aoe+1)+'.'+inttostr(global_aoe+2)
             else einf[i]:=inttostr(global_aoe+1)+'-'+inttostr(global_aoe+aoe);
             global_aoe:=global_aoe+aoe;
              for j:=1 to aoe do begin
                  writeln(xj,'      <Tool N="'+inttostr(el_n)+'">');
                  writeln(xj,'        <FinitionType>'+inttostr(j)+'</FinitionType>'); // machining pass number
                  writeln(xj,'        <Name>'+elv[0]+'_R'+inttostr(j)+'</Name>');
                  for k:=0 to Memo1.Lines.Count-1 do begin
                     relv:=SplitString(',',Memo1.Lines[k]);
                     if relv[1]='U' then begin
                        relv2:=SplitString(';',relv[0]);
                        if relv2[0]=elv[0] then begin
                           if relv2[1]='R'+inttostr(j) then begin

                              oldx:=strtofloat(relv[10]);
                              //showmessage(floattostr(oldx));
                              oldy:=strtofloat(relv[11]);
                              curz:=relv[12];
                              oldc:=strtofloat(relv[15]);
                           end;
                        end;
                     end;
                  end;
                  newc:=roundto(normalize_c(oldc),3);
                  if oldx=0 then oldx:=0.0001;
                  if oldy=0 then oldy:=0.0001;
                  newx:=roundto((oldx*cos(degtorad(-newc)))-(oldy*sin(degtorad(-newc))),3);
                  showmessage('newx: '+floattostr(newx));
                  newy:=roundto((oldx*sin(degtorad(-newc)))+(oldy*cos(degtorad(-newc))),3);
                  writeln(xj,'        <X>'+floattostr(newx)+'</X>');
                  writeln(xj,'        <Y>'+floattostr(newy)+'</Y>');
                  writeln(xj,'        <Z>'+curz+'</Z>');
                  writeln(xj,'        <C>'+floattostr(newc)+'</C>');
                  magpos:='';
                  for k:=length(elv[(8+j)]) to 3 do magpos:=magpos+'0';
                  magpos:=magpos+elv[(8+j)];
                  writeln(xj,'        <MagPos>20'+magpos+'</MagPos>');
                  writeln(xj,'        <Inertie>1</Inertie>');
                  writeln(xj,'        <UnderSize>'+floattostr(strtofloat(elv[(2+j)])/2)+'</UnderSize>');
                  writeln(xj,'        <CreationDate>'+fd+'</CreationDate>');
                  writeln(xj,'        <ModificationDate>'+fd+'</ModificationDate>');
                  writeln(xj,'        <Radius></Radius>');
                  writeln(xj,'        <ChipID></ChipID>');
                  writeln(xj,'        <SizeInMagasin>1</SizeInMagasin>');
                  writeln(xj,'        <Material>'+mat_x400(elv[1])+'</Material>');
                  writeln(xj,'        <ToolDecFamily>'+inttostr(el_n)+'</ToolDecFamily>');
                  writeln(xj,'        <ToolDecCount1>100</ToolDecCount1>');
                  writeln(xj,'        <ToolDecCount2>100</ToolDecCount2>');
                  writeln(xj,'        <ToolDecCount3>100</ToolDecCount3>');
                  writeln(xj,'        <ToolDecCount4>100</ToolDecCount4>');
                  writeln(xj,'        <ToolDecCount5>100</ToolDecCount5>');
                  writeln(xj,'        <ToolDecWear>0</ToolDecWear>');
                  writeln(xj,'        <UEDMComp>0</UEDMComp>');
                  writeln(xj,'        <UCavComp>0</UCavComp>');
                  writeln(xj,'        <FrontalOffset>0</FrontalOffset>');
                  writeln(xj,'        <ToolDecWearF>0</ToolDecWearF>');
                  writeln(xj,'        <ToolReals>');
                  writeln(xj,'          <ToolReal N="'+inttostr(el_n+999)+'">');
                  writeln(xj,'            <Name></Name>');
                  writeln(xj,'            <X>0</X>');
                  writeln(xj,'            <Y>0</Y>');
                  writeln(xj,'            <Z>0</Z>');
                  writeln(xj,'            <C>0</C>');
                  writeln(xj,'            <MagPos></MagPos>');
                  writeln(xj,'            <UnderSize>0</UnderSize>');
                  writeln(xj,'            <CreationDate>'+fd+'</CreationDate>');
                  writeln(xj,'            <ModificationDate>'+fd+'</ModificationDate>');
                  writeln(xj,'            <Radius></Radius>');
                  writeln(xj,'            <ChipID></ChipID>');
                  writeln(xj,'            <ToolDecCount1>100</ToolDecCount1>');
                  writeln(xj,'            <ToolDecCount2>100</ToolDecCount2>');
                  writeln(xj,'            <ToolDecCount3>100</ToolDecCount3>');
                  writeln(xj,'            <ToolDecCount4>100</ToolDecCount4>');
                  writeln(xj,'            <ToolDecCount5>100</ToolDecCount5>');
                  writeln(xj,'            <initUnderSize>0</initUnderSize>');
                  writeln(xj,'            <initToolDecCount1>-2</initToolDecCount1>');
                  writeln(xj,'            <initToolDecCount2>-2</initToolDecCount2>');
                  writeln(xj,'            <initToolDecCount3>-2</initToolDecCount3>');
                  writeln(xj,'            <initToolDecCount4>-2</initToolDecCount4>');
                  writeln(xj,'            <initToolDecCount5>-2</initToolDecCount5>');
                  writeln(xj,'            <Inertie>1</Inertie>');
                  writeln(xj,'            <fragUse>0</fragUse>');
                  writeln(xj,'            <fragSCode>0</fragSCode>');
                  writeln(xj,'            <FrontalOffset>0</FrontalOffset>');
                  writeln(xj,'            <initFrontalOffset>0</initFrontalOffset>');
                  writeln(xj,'            <initTemplateNum>0</initTemplateNum>');
                  writeln(xj,'          </ToolReal>');
                  writeln(xj,'        </ToolReals>');
                  writeln(xj,'      </Tool>');
                  inc(el_n);
              end;
              if CheckBox8.Checked then begin
                 writeln(xj,'      <Tool N="'+inttostr(el_n)+'">');
                 writeln(xj,'        <FinitionType>6</FinitionType>'); //finition type 6 means scanner
                 writeln(xj,'        <Name>SKANER</Name>');
                 writeln(xj,'        <X>0</X>');
                 writeln(xj,'        <Y>0</Y>');
                 writeln(xj,'        <Z>120</Z>');
                 writeln(xj,'        <C>0</C>');
                 writeln(xj,'        <MagPos></MagPos>');
                 writeln(xj,'        <Inertie>1</Inertie>');
                 writeln(xj,'        <UnderSize>0</UnderSize>');
                 writeln(xj,'        <CreationDate>'+fd+'</CreationDate>');
                 writeln(xj,'        <ModificationDate>'+fd+'</ModificationDate>');
                 writeln(xj,'        <Radius></Radius>');
                 writeln(xj,'        <ChipID></ChipID>');
                 writeln(xj,'        <SizeInMagasin>1</SizeInMagasin>');
                 writeln(xj,'        <Material></Material>');
                 writeln(xj,'        <ToolDecFamily></ToolDecFamily>');
                 for j:=1 to 5 do writeln(xj,'        <ToolDecCount'+inttostr(j)+'>100</ToolDecCount'+inttostr(j)+'>');
                 writeln(xj,'        <ToolDecWear>0</ToolDecWear>');
                 writeln(xj,'        <UEDMComp>0</UEDMComp>');
                 writeln(xj,'        <UCavComp>0</UCavComp>');
                 writeln(xj,'        <FrontalOffset>0</FrontalOffset>');
                 writeln(xj,'        <ToolDecWearF>0</ToolDecWearF>');
                 writeln(xj,'        <ToolReals>');
                 writeln(xj,'          <ToolReal N="'+inttostr(el_n+999)+'">');
                 writeln(xj,'            <Name></Name>');
                 writeln(xj,'            <X>0</X>');
                 writeln(xj,'            <Y>0</Y>');
                 writeln(xj,'            <Z>0</Z>');
                 writeln(xj,'            <C>0</C>');
                 writeln(xj,'            <MagPos></MagPos>');
                 writeln(xj,'            <UnderSize>0</UnderSize>');
                 writeln(xj,'            <CreationDate>'+fd+'</CreationDate>');
                 writeln(xj,'            <ModificationDate>'+fd+'</ModificationDate>');
                 writeln(xj,'            <Radius></Radius>');
                 writeln(xj,'            <ChipID></ChipID>');
                 for j:=1 to 5 do writeln(xj,'            <ToolDecCount'+inttostr(j)+'>100</ToolDecCount'+inttostr(j)+'>');
                 writeln(xj,'            <initUnderSize>0</initUnderSize>');
                 for j:=1 to 5 do writeln(xj,'            <initToolDecCount'+inttostr(j)+'>-2</initToolDecCount'+inttostr(j)+'>');
                 writeln(xj,'            <Inertie>1</Inertie>');
                 writeln(xj,'            <fragUse>0</fragUse>');
                 writeln(xj,'            <fragSCode>0</fragSCode>');
                 writeln(xj,'            <FrontalOffset>0</FrontalOffset>');
                 writeln(xj,'            <initFrontalOffset>0</initFrontalOffset>');
                 writeln(xj,'            <initTemplateNum>0</initTemplateNum>');
                 writeln(xj,'          </ToolReal>');
                 writeln(xj,'        </ToolReals>');
                 writeln(xj,'      </Tool>');
              end;
             end;
          end;
          writeln(xj,'    </Tools>');
          ProgressBar1.Position:=40;
          writeln(xj,'    <Shapes>');
          shape_nr:=0;
          for i:=0 to ListBox2.Count-1 do begin
             do_this_el:=False;
             for j:=0 to Form2.CheckListBox1.Count-1 do begin
                if (Form2.CheckListBox1.Items[j]=ListBox2.Items[i]) then begin
                   elv:=SplitString(';',Form2.ListBox1.Items[j]);
                   if elv[0]=ListBox2.Items[i] then elind:=j;
                   if Form2.CheckListBox1.Checked[j] then do_this_el:=True;
                end;
             end;
             if do_this_el then begin
                inc(shape_nr);
             writeln(xj,'      <Shape N="'+inttostr(shape_nr)+'">');
             writeln(xj,'        <CreationDate>'+fd+'</CreationDate>');
             writeln(xj,'        <ModificationDate>'+fd+'</ModificationDate>');
             writeln(xj,'        <Comment>'+ListBox2.Items[i]+'</Comment>');
             writeln(xj,'        <ElectMaterialCode>'+mat_x400_code(elv[1])+'</ElectMaterialCode>');
             writeln(xj,'        <PieceMaterialCode>1</PieceMaterialCode>'); //steel
             writeln(xj,'        <PrepElectMaterialSymb>'+mat_x400(elv[1])+'</PrepElectMaterialSymb>');
             writeln(xj,'        <ElectMaterialSymb>'+mat_x400(elv[1])+'</ElectMaterialSymb>');
             writeln(xj,'        <PrepPieceMaterialSymb>AC</PrepPieceMaterialSymb>');
             writeln(xj,'        <PieceMaterialSymb>AC</PieceMaterialSymb>');
             writeln(xj,'        <PrepApplicationType>1</PrepApplicationType>');
             writeln(xj,'        <ApplicationType>1</ApplicationType>');
             writeln(xj,'        <PrepSurfaceFinishingCH>'+elv[20][4]+elv[20][5]+'</PrepSurfaceFinishingCH>');
             writeln(xj,'        <SurfaceFinishingCH>'+elv[20][4]+elv[20][5]+'</SurfaceFinishingCH>');
             writeln(xj,'        <PrepDepth>'+floattostr(strtofloat(ListBox6.Items[i])*(-1))+'</PrepDepth>');
             writeln(xj,'        <EDMDepth>'+floattostr(strtofloat(ListBox6.Items[i])*(-1))+'</EDMDepth>');
             writeln(xj,'        <AdjDepth>'+floattostr(strtofloat(ListBox6.Items[i])*(-1))+'</AdjDepth>');
             writeln(xj,'        <ToolLength>'+floattostr(1+strtofloat(ListBox6.Items[i])*(-1))+'</ToolLength>');
             writeln(xj,'        <PrepToolLength>'+floattostr(1+strtofloat(ListBox6.Items[i])*(-1))+'</PrepToolLength>');
                                 //elv[19] - 0= Equimode 3D, 1=Vector (napis), 2=Cylinder, 3=Prostokąt
             writeln(xj,'        <PrepGCycle>4</PrepGCycle>');
             writeln(xj,'        <GCycle>4</GCycle>');
             writeln(xj,'        <PrepCavityStyle>1</PrepCavityStyle>');
             writeln(xj,'        <CavityStyle>1</CavityStyle>');
             writeln(xj,'        <PrepCavityAngle>0</PrepCavityAngle>');
             writeln(xj,'        <CavityAngle>0</CavityAngle>');
             writeln(xj,'        <PrepMaxArea>'+ListBox8.Items[i]+'</PrepMaxArea>');
             writeln(xj,'        <MaxArea>'+ListBox8.Items[i]+'</MaxArea>');
             writeln(xj,'        <PreMilledCavity>0</PreMilledCavity>');
             writeln(xj,'        <LateralExtraThickness>0</LateralExtraThickness>');
             writeln(xj,'        <FrontalExtraThickness>0</FrontalExtraThickness>');
             writeln(xj,'        <PrepPulseType></PrepPulseType>');
             writeln(xj,'        <PulseType></PulseType>');
             writeln(xj,'        <PrepQCode></PrepQCode>');
             writeln(xj,'        <QCode></QCode>');
             writeln(xj,'        <ProtectionPieceAttack>1</ProtectionPieceAttack>');
             writeln(xj,'        <ProtectionCC>1</ProtectionCC>');
             writeln(xj,'        <ProtectionSpacc>1</ProtectionSpacc>');
             writeln(xj,'        <ProtectionOnBadMachining>0</ProtectionOnBadMachining>');
             writeln(xj,'        <AttackSensitivelessTime>0</AttackSensitivelessTime>');
             writeln(xj,'        <PrepFlushingM70>A0B0C0D0</PrepFlushingM70>');
             writeln(xj,'        <FlushingM70>A0B0C0D0</FlushingM70>');
             writeln(xj,'        <AspirM71></AspirM71>');
             writeln(xj,'        <PrepSpinSpeed>0</PrepSpinSpeed>');
             writeln(xj,'        <SpinSpeed></SpinSpeed>');
             writeln(xj,'        <PrepSpinCode>5</PrepSpinCode>');
             writeln(xj,'        <SpinCode>5</SpinCode>');
             writeln(xj,'        <PrepDownTranslationRadius></PrepDownTranslationRadius>');
             writeln(xj,'        <DownTranslationRadius></DownTranslationRadius>');
             writeln(xj,'        <PrepHelicFromRefCavity>0</PrepHelicFromRefCavity>');
             writeln(xj,'        <HelicFromRefCavity>0</HelicFromRefCavity>');
             writeln(xj,'        <PrepCycleFinishingType></PrepCycleFinishingType>');
             writeln(xj,'        <CycleFinishingType></CycleFinishingType>');
             writeln(xj,'        <PrepCycleAngle>0</PrepCycleAngle>');
             writeln(xj,'        <CycleAngle>0</CycleAngle>');
             writeln(xj,'        <PrepAngul>0</PrepAngul>');
             writeln(xj,'        <Angul>0</Angul>');
             writeln(xj,'        <PrepCycleCornersNb>4</PrepCycleCornersNb>');
             writeln(xj,'        <CycleCornersNb>4</CycleCornersNb>');
             writeln(xj,'        <PrepCycleHelicStep>0</PrepCycleHelicStep>');
             writeln(xj,'        <CycleHelicStep>0</CycleHelicStep>');
             writeln(xj,'        <TechnoName></TechnoName>');
             if elv[8]<>'0' then aoe:=6
              else if elv[7]<>'0' then aoe:=5
              else if elv[6]<>'0' then aoe:=4
              else if elv[5]<>'0' then aoe:=3
              else if elv[4]<>'0' then aoe:=2
              else aoe:=1;
             write(xj,'        <JobReportToolList>');
             write(xj,einf[elind]);
             writeln(xj,'</JobReportToolList>');
             writeln(xj,'        <JobReportPieceList>'+LabeledEdit1.Text+'</JobReportPieceList>'); //all pieces
             writeln(xj,'        <JobReportPointList>'+inttostr(shape_nr)+'</JobReportPointList>'); // same as point list
             writeln(xj,'        <MachiningPassNbr>'+inttostr(aoe)+'</MachiningPassNbr>'); //no. of electrodes = passes
             writeln(xj,'        <CalculatedArea>0</CalculatedArea>');
             writeln(xj,'        <PrepInvPolarity>0</PrepInvPolarity>');
             writeln(xj,'        <InvPolarity>0</InvPolarity>');
             writeln(xj,'        <PrepAdditionalRadius></PrepAdditionalRadius>');
             writeln(xj,'        <AdditionalRadius></AdditionalRadius>');
             writeln(xj,'        <PrepTrajWithoutCAxis>0</PrepTrajWithoutCAxis>');
             writeln(xj,'        <TrajWithoutCAxis>0</TrajWithoutCAxis>');
             writeln(Xj,'        <PrepToolRadius>0</PrepToolRadius>');
             writeln(xj,'        <ToolRadius>0</ToolRadius>');
             writeln(xj,'        <TrajMode></TrajMode>');
             writeln(xj,'        <PrepTrajMode></PrepTrajMode>');
             writeln(xj,'        <PrepContouringRemovalType>0</PrepContouringRemovalType>');
             writeln(xj,'        <ContouringRemovalType>0</ContouringRemovalType>');
             writeln(xj,'        <TruncateAngle></TruncateAngle>');
             writeln(xj,'        <PrepTruncateAngle></PrepTruncateAngle>');
             writeln(xj,'        <MegaSizeOptimization>0</MegaSizeOptimization>');
             writeln(xj,'        <EDMGenerationUpToDate>0</EDMGenerationUpToDate>');
             writeln(xj,'        <PrepAdditionalDistanceX></PrepAdditionalDistanceX>');
             writeln(xj,'        <AdditionalDistanceX></AdditionalDistanceX>');
             writeln(xj,'        <PrepAdditionalDistanceY></PrepAdditionalDistanceY>');
             writeln(xj,'        <AdditionalDistanceY></AdditionalDistanceY>');
             writeln(xj,'        <PrepApproachPath></PrepApproachPath>');
             writeln(xj,'        <ApproachPath></ApproachPath>');
             writeln(Xj,'        <PrepDielectricType>0</PrepDielectricType>');
             writeln(xj,'        <DielectricType>0</DielectricType>');
             writeln(xj,'        <AdjCycleHelicStep>0</AdjCycleHelicStep>');
             writeln(xj,'        <NotEmergingHole>0</NotEmergingHole>');
             writeln(xj,'        <AmorcState>0</AmorcState>');
             writeln(xj,'        <AmorcTime>0</AmorcTime>');
             writeln(xj,'        <MultiCyclesCavity>0</MultiCyclesCavity>');
             writeln(xj,'        <PrepDownTranslationType></PrepDownTranslationType>');
             writeln(xj,'        <DownTranslationType></DownTranslationType>');
             writeln(xj,'        <PrepLateralShape>0</PrepLateralShape>');
             writeln(Xj,'        <LateralShape>0</LateralShape>');
             writeln(xj,'        <PrepLateralShapeHeight></PrepLateralShapeHeight>');
             writeln(xj,'        <LateralShapeHeight></LateralShapeHeight>');
             writeln(xj,'        <Circumference>0</Circumference>');
             writeln(xj,'        <OptimizedSettingRadius>0</OptimizedSettingRadius>');
             writeln(xj,'        <PrepMultiShape>0</PrepMultiShape>');
             writeln(xj,'        <MultiShape>0</MultiShape>');
             writeln(xj,'        <PrepContourXStartPoint>0</PrepContourXStartPoint>');
             writeln(xj,'        <ContourXStartPoint>0</ContourXStartPoint>');
             writeln(xj,'        <PrepContourYStartPoint>0</PrepContourYStartPoint>');
             writeln(xj,'        <ContourYStartPoint>0</ContourYStartPoint>');
             writeln(xj,'        <PrepContourZStartPoint>0</PrepContourZStartPoint>');
             writeln(xj,'        <ContourZStartPoint>0</ContourZStartPoint>');
             writeln(xj,'        <PrepContourCStartPoint>0</PrepContourCStartPoint>');
             writeln(xj,'        <ContourCStartPoint>0</ContourCStartPoint>');
             writeln(xj,'        <PrepContourXStopPoint>0</PrepContourXStopPoint>');
             writeln(xj,'        <ContourXStopPoint>0</ContourXStopPoint>');
             writeln(xj,'        <PrepContourYStopPoint>0</PrepContourYStopPoint>');
             writeln(xj,'        <ContourYStopPoint>0</ContourYStopPoint>');
             writeln(xj,'        <PrepContourZStopPoint>0</PrepContourZStopPoint>');
             writeln(xj,'        <ContourZStopPoint>0</ContourZStopPoint>');
             writeln(xj,'        <PrepContourCStopPoint>0</PrepContourCStopPoint>');
             writeln(xj,'        <ContourCStopPoint>0</ContourCStopPoint>');
             writeln(xj,'        <PrepContourRightOrLeft>0</PrepContourRightOrLeft>');
             writeln(xj,'        <ContourRightOrLeft>0</ContourRightOrLeft>');
             writeln(xj,'        <PrepFlushingPressure>1</PrepFlushingPressure>');
             writeln(xj,'        <FlushingPressure>1</FlushingPressure>');
             writeln(xj,'        <PrepHelicUndersizeAdjust>0</PrepHelicUndersizeAdjust>');
             writeln(xj,'        <HelicUndersizeAdjust>0</HelicUndersizeAdjust>');
             writeln(xj,'        <PrepHelicThreadAngle></PrepHelicThreadAngle>');
             writeln(xj,'        <HelicThreadAngle></HelicThreadAngle>');
             writeln(xj,'        <GeometryType>0</GeometryType>');
             writeln(xj,'        <GeometrySideA></GeometrySideA>');
             writeln(xj,'        <GeometrySideB></GeometrySideB>');
             writeln(xj,'        <GeometryDiameter></GeometryDiameter>');
             writeln(xj,'        <PrepLEDCavityNb>1</PrepLEDCavityNb>');
             writeln(xj,'        <LEDCavityNb></LEDCavityNb>');
             writeln(xj,'        <PrepCHSpeedPriority>1</PrepCHSpeedPriority>');
             writeln(xj,'        <CHSpeedPriority>1</CHSpeedPriority>');
             writeln(xj,'        <PrepWearSpeedPriority>2</PrepWearSpeedPriority>');
             writeln(xj,'        <WearSpeedPriority>2</WearSpeedPriority>');
             writeln(xj,'        <PulsBackWithoutVoltage>0</PulsBackWithoutVoltage>');
             writeln(xj,'        <PrepWhiteLayerPriority>0</PrepWhiteLayerPriority>');
             writeln(xj,'        <WhiteLayerPriority>0</WhiteLayerPriority>');
             writeln(xj,'        <CHText></CHText>');
             writeln(xj,'        <WearPartType>0</WearPartType>');
             writeln(xj,'        <WearPartSetting>2</WearPartSetting>');
             mdet:='AC';
             for j:=1 to 5 do begin
                //showmessage(inttostr(j));
                writeln(xj,'        <PrepPartMatPass'+inttostr(j)+'>'+mdet+'</PrepPartMatPass'+inttostr(j)+'>');
                writeln(xj,'        <PartMatPass'+inttostr(j)+'>'+mdet+'</PartMatPass'+inttostr(j)+'>');
                writeln(xj,'        <PrepToolMatPass'+inttostr(j)+'>'+mat_x400(elv[1])+'</PrepToolMatPass'+inttostr(j)+'>');
                writeln(xj,'        <ToolMatPass'+inttostr(j)+'>'+mat_x400(elv[1])+'</ToolMatPass'+inttostr(j)+'>');
             end;
             for j:=1 to 5 do begin
                writeln(xj,'        <PrepCHSpeedPriority'+inttostr(j)+'>2</PrepCHSpeedPriority'+inttostr(j)+'>');
                writeln(xj,'        <CHSpeedPriority'+inttostr(j)+'>2</CHSpeedPriority'+inttostr(j)+'>');
                writeln(xj,'        <PrepLastSettingPriority'+inttostr(j)+'>2</PrepLastSettingPriority'+inttostr(j)+'>');
                writeln(xj,'        <LastSettingPriority'+inttostr(j)+'>2</LastSettingPriority'+inttostr(j)+'>');
             end;
             for j:=1 to 5 do writeln(xj,'        <LSB'+inttostr(j)+'></LSB'+inttostr(j)+'>');
             for j:=1 to 5 do writeln(xj,'        <FSB'+inttostr(j)+'></FSB'+inttostr(j)+'>');
             writeln(xj,'        <PrepLimitStartPower>0</PrepLimitStartPower>');
             writeln(xj,'        <LimitStartPower>0</LimitStartPower>');
             for j:=1 to 5 do writeln(xj,'        <PrepLSB'+inttostr(j)+'></PrepLSB'+inttostr(j)+'>');
             for j:=1 to 5 do writeln(xj,'        <PrepFSB'+inttostr(j)+'></PrepFSB'+inttostr(j)+'>');
             for j:=1 to 5 do begin
                writeln(xj,'        <PrepAutoMachPass'+inttostr(j)+'>1</PrepAutoMachPass'+inttostr(j)+'>');
                writeln(xj,'        <AutoMachPass'+inttostr(j)+'>1</AutoMachPass'+inttostr(j)+'>');
             end;
             writeln(xj,'        <MachPassFromTecformStep2>0</MachPassFromTecformStep2>');
             writeln(xj,'        <specificpassModified>0</specificpassModified>');
             for j:=1 to 5 do writeln(xj,'        <TechnoNamePass'+inttostr(j)+'></TechnoNamePass'+inttostr(j)+'>');
             writeln(xj,'        <PreporbExeMode>0</PreporbExeMode>');
             writeln(xj,'        <orbExeMode>0</orbExeMode>');
             writeln(Xj,'        <PrepHeaderLimitStartPower>0</PrepHeaderLimitStartPower>');
             writeln(xj,'        <HeaderLimitStartPower>0</HeaderLimitStartPower>');
             writeln(xj,'        <PrepHeaderPriority>2</PrepHeaderPriority>');
             writeln(xj,'        <HeaderPriority>2</HeaderPriority>');
             writeln(xj,'        <PrepHeaderAuto>1</PrepHeaderAuto>');
             writeln(xj,'        <HeaderAuto>1</HeaderAuto>');
             writeln(xj,'        <PrepHLS></PrepHLS>');
             writeln(xj,'        <HLS></HLS>');
             writeln(xj,'        <PrepPreMilledAuto>1</PrepPreMilledAuto>');
             writeln(xj,'        <PreMilledAuto>1</PreMilledAuto>');
             writeln(xj,'        <PrepPreMilledHeaderSecurity></PrepPreMilledHeaderSecurity>');
             writeln(xj,'        <PreMilledHeaderSecurity></PreMilledHeaderSecurity>');
             writeln(xj,'        <PrepPreMilledHeaderPriority>2</PrepPreMilledHeaderPriority>');
             writeln(xj,'        <PreMilledHeaderPriority>2</PreMilledHeaderPriority>');
             writeln(xj,'        <PreMilledRadius>0</PreMilledRadius>');
             writeln(xj,'        <PrepTexturing>0</PrepTexturing>');
             writeln(xj,'        <Texturing></Texturing>');
             writeln(xj,'        <PrepNoMachiningInTime>0</PrepNoMachiningInTime>');
             writeln(xj,'        <NoMachiningInTime>0</NoMachiningInTime>');
             writeln(xj,'        <PrioritiesForDescJob></PrioritiesForDescJob>');
             writeln(xj,'        <PrepTomeo>0</PrepTomeo>');
             writeln(xj,'        <Tomeo>0</Tomeo>');
             writeln(xj,'        <PrepEstimatedWearLength>0</PrepEstimatedWearLength>');
             writeln(xj,'        <EstimatedWearLength>0</EstimatedWearLength>');
             writeln(xj,'        <SurfaceEvolution><SurfaceEvolution></SurfaceEvolution></SurfaceEvolution>');
             writeln(xj,'        <PrepSetRetOrigin></PrepSetRetOrigin>');
             writeln(xj,'        <SetRetOrigin></SetRetOrigin>');
             writeln(xj,'        <ShapePieces>');
             for j:=0 to length(pieces)-1 do begin
                writeln(xj,'          <ShapePiece PN="'+inttostr(j+1)+'">');
                writeln(xj,'            <CreationDate>'+fd+'</CreationDate>');
                writeln(xj,'            <ModificationDate>'+fd+'</ModificationDate>');
                writeln(xj,'          </ShapePiece>');
             end;
             writeln(xj,'        </ShapePieces>');
             writeln(xj,'        <ShapePoints>');
             writeln(xj,'          <ShapePoint PN="'+inttostr(shape_nr)+'">');
             writeln(xj,'            <CreationDate>'+fd+'</CreationDate>');
             writeln(xj,'            <ModificationDate>'+fd+'</ModificationDate>');
             writeln(Xj,'          </ShapePoint>');
             writeln(xj,'        </ShapePoints>');
             writeln(xj,'        <ShapeTools>');
             for j:=0 to Form2.CheckListBox1.Count-1 do begin
                 if elv[0]=Form2.CheckListBox1.Items[j] then tl:=SplitString(',',einf2[j]);
             end;
             for j:=0 to length(tl)-1 do begin
                writeln(xj,'          <ShapeTool TN="'+tl[j]+'">');
                writeln(xj,'            <CreationDate>'+fd+'</CreationDate>');
                writeln(xj,'            <ModificationDate>'+fd+'</ModificationDate>');
                writeln(xj,'          </ShapeTool>');
             end;
             writeln(xj,'        </ShapeTools>');
             writeln(xj,'        <SettingTables>');
             for j:=1 to aoe do begin
                writeln(xj,'          <SettingTable FT="'+inttostr(j)+'">');
                writeln(xj,'            <CreationDate>'+fd+'</CreationDate>');
                writeln(xj,'            <ModificationDate>'+fd+'</ModificationDate>');
                writeln(xj,'            <CodeS>0</CodeS>');
                writeln(xj,'            <PrepUnderSize>'+floattostr(strtofloat(elv[(2+j)])/2)+'</PrepUnderSize>');
                writeln(xj,'            <UnderSize>'+floattostr(strtofloat(elv[(2+j)])/2)+'</UnderSize>');
                writeln(xj,'            <HCorrection></HCorrection>');
                writeln(xj,'            <WCorrection></WCorrection>');
                writeln(xj,'            <EStart>0</EStart>');
                writeln(xj,'            <EEnd>0</EEnd>');
                writeln(xj,'            <PrepToolLength>'+inttostr(floor((strtofloat(ListBox6.Items[i])*(-1)))+1)+'</PrepToolLength>');
                writeln(xj,'            <ToolLength>'+inttostr(floor((strtofloat(ListBox6.Items[i])*(-1)))+1)+'</ToolLength>');
                writeln(xj,'            <ISOGAPStrategy>3</ISOGAPStrategy>');
                writeln(xj,'            <PrepISOGAPStrategy>3</PrepISOGAPStrategy>');
                writeln(xj,'            <ISOGAPStep>3</ISOGAPStep>');
                writeln(xj,'            <PrepISOGAPStep>3</PrepISOGAPStep>');
                writeln(xj,'            <ISOGAPPendul></ISOGAPPendul>');
                writeln(xj,'            <PrepISOGAPPendul></PrepISOGAPPendul>');
                writeln(xj,'            <WearPartType>0</WearPartType>');
                writeln(xj,'            <WearPartSetting>2</WearPartSetting>');
                writeln(xj,'          </SettingTable>');
             end;
             writeln(xj,'        </SettingTables>');
             writeln(xj,'        <FuturaSettings>');
             writeln(xj,'          <FuturaMemo>AE6A0D</FuturaMemo>');
             writeln(xj,'          <CreationDate>'+fd+'</CreationDate>');
             writeln(xj,'          <ModificationDate>'+fd+'</ModificationDate>');
             writeln(xj,'          <FuturaMemoRef>2D640A</FuturaMemoRef>');
             writeln(xj,'          <Estimation></Estimation>');
             writeln(xj,'        </FuturaSettings>');
             writeln(xj,'      </Shape>');
             end;
          end;
          writeln(xj,'    </Shapes>');
          ProgressBar1.Position:=50;
          writeln(xj,'    <Related_Files>');
          writeln(xj,'      <Related_File Name="O0001.iso">');
          writeln(xj,'        <Line N="1">O0001 ('+Edit3.Text+')</Line>');
          writeln(xj,'        <Line N="2"></Line>');
          writeln(xj,'        <Line N="3"></Line>');
          writeln(xj,'        <Line N="4">M30</Line>');
          writeln(xj,'        <Line N="5"></Line>');
          writeln(xj,'      </Related_File>');
          writeln(xj,'    </Related_Files>');
          writeln(xj,'    <Machining_Reports>');
          writeln(xj,'    </Machining_Reports>');
          writeln(xj,'  </Job>');
          writeln(xj,'</Jobs>');
          CloseFile(xj);
          ProgressBar1.Position:=60;
          Showmessage('Program '+Edit3.Text+'.xmlj zapisany');
          //SysUtils.ExecuteProcess('explorer.exe','/select,'+SaveDialog3.FileName);
      end;
  end
  else ShowMessage('Uzupełnij dane elektrod.');
end;

procedure TForm1.Button11Click(Sender: TObject);
begin

end;

procedure TForm1.Button13Click(Sender: TObject);

begin
  if SaveDialog1.Execute then begin

  end;
end;

procedure TForm1.Button14Click(Sender: TObject);
var rnumber,rname,str,dir,strat,gnam,z_in_mach,mach_add,z_in_geo,geo_add,geo_add2,iname,iusing,sp_coords,sp_coordsa,drbok,mtd,only_ret,only_vector,pozp,ksp,pline,elmname,phase2,eip2,elno,multi_tf,umode,le,f00f,f00_sk,fold,nap,strange_number,littledot:string;
pval,eval,pval2,tf_val,pe_val,lb1,prefil,p_elval,p_elam,isoval,chck:TArrayOfString;
  min_z,i,j,f2i,f2j,k,ii,iii,using_nr,amount_of_el,f2amount_of_el,kapiel,last_using,bea_nr,check_preset,check_user,jjj,aoe,cvdi9:integer;
  job,jor,tek,ter,iso,isr,preset,fut,fur,f0r,f00,tempp:TextFile;
  ust:TIniFile;
  phase,eip:Array[1..4] of integer;
  do_this_el,exists_in_list,line_changed:boolean;
begin
 ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
 fold:=ust.ReadString('settings','createFolder','1');
 nap:=ust.ReadString('settings','naPen','0');
 ListBox10.Clear;
 Form2.ListBox2.Clear;
    ProgressBar1.Position:=(Form2.CheckListBox1.Count-1)*10;
   if Form2.Label13.Caption='done' then begin // save FUT then JOB
      if OpenDialog3.Execute then begin
           check_preset:=0;
           check_user:=0;
           AssignFile(preset,OpenDialog3.FileName);
           AssignFile(tempp,Application.Location+'temp.mes');
           reset(preset);
           rewrite(tempp);
           repeat
                readln(preset,pline);
                prefil:=SplitString(',',pline);
                pval2:=SplitString(';',prefil[0]);
                line_changed:=False;
                for f2i:=0 to Form2.ListBox1.Count-1 do begin //add multi electrodes to mes file
                    lb1:=SplitString(';',Form2.ListBox1.Items[f2i]);
                    if ((lb1[15]=pval2[0]) and (lb1[16]='1')) then begin  //if is multi electrode and real name matched
                        line_changed:=True;
                        if pval2[1]='R1' then begin
                          writeln(tempp,pline);
                          writeln(tempp,pval2[0]+';R2,U,,0,,,,,,,'+floattostr(strtofloat(prefil[10])*(-1))+','+floattostr(strtofloat(prefil[11])*(-1))+','+prefil[12]+',0.000,0.000,'+floattostr(strtofloat(prefil[15])+180)+',0,0,0,,0.000,,,,,,');
                        end;
                        if pval2[1]='R2' then begin
                          writeln(tempp,pval2[0]+';R3,U,,0,,,,,,,'+prefil[10]+','+prefil[11]+','+prefil[12]+',0.000,0.000,'+prefil[15]+',0,0,0,,0.000,,,,,,');
                          writeln(tempp,pval2[0]+';R4,U,,0,,,,,,,'+floattostr(strtofloat(prefil[10])*(-1))+','+floattostr(strtofloat(prefil[11])*(-1))+','+prefil[12]+',0.000,0.000,'+floattostr(strtofloat(prefil[15])+180)+',0,0,0,,0.000,,,,,,');
                        end;
                        if pval2[1]='R3' then begin
                          writeln(tempp,pval2[0]+';R5,U,,0,,,,,,,'+prefil[10]+','+prefil[11]+','+prefil[12]+',0.000,0.000,'+prefil[15]+',0,0,0,,0.000,,,,,,');
                          writeln(tempp,pval2[0]+';R6,U,,0,,,,,,,'+floattostr(strtofloat(prefil[10])*(-1))+','+floattostr(strtofloat(prefil[11])*(-1))+','+prefil[12]+',0.000,0.000,'+floattostr(strtofloat(prefil[15])+180)+',0,0,0,,0.000,,,,,,');
                        end;
                    end;
                end;
                if line_changed=False then writeln(tempp,pline);
           until eof(preset);
           CloseFile(preset);
           CloseFile(tempp);
           AssignFile(preset,Application.Location+'temp.mes');
           reset(preset);
           repeat
              readln(preset,pline); //read mes file
              inc(check_preset);
              pval:=SplitString(',',pline);
              for ii:=0 to (Form2.ListBox1.Count-1) do begin  //fill Form2.ListBox2 with real electrode data
                  eval:=SplitString(';',Form2.ListBox1.Items[ii]);
                  pval2:=SplitString(';',pval[0]);
                  if eval[15]=pval2[0] then begin  // if electrode name matched
                     if pval2[1]='R1' then begin //0             1            2            3            4          5          6              7            8            9         10
                                           //  name             Rx           mat          fp           u1          x          y              z            c           poz        dxf name
                         Form2.ListBox2.Items.Add(eval[15]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[3]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[9]+';'+eval[0]);
                     end
                     else if ((pval2[1]='R2') and (eval[4]<>'0')) then Form2.ListBox2.Items.Add(eval[15]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[4]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[10]+';'+eval[0])
                     else if ((pval2[1]='R3') and (eval[5]<>'0')) then Form2.ListBox2.Items.Add(eval[15]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[5]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[11]+';'+eval[0])
                     else if ((pval2[1]='R4') and (eval[6]<>'0')) then Form2.ListBox2.Items.Add(eval[15]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[6]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[12]+';'+eval[0])
                     else if ((pval2[1]='R5') and (eval[7]<>'0')) then Form2.ListBox2.Items.Add(eval[15]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[7]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[13]+';'+eval[0])
                     else if ((pval2[1]='R6') and (eval[8]<>'0')) then Form2.ListBox2.Items.Add(eval[15]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[8]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[14]+';'+eval[0]);
                  end;
              end;
           until eof(preset);
           CloseFile(preset);
           //save FUT files
           if fold='1' then begin
              if nap='1' then dir:=extractfiledir(OpenDialog3.FileName)+'\'+Form1.Edit3.Text
              else dir:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output')+'\'+Form1.Edit3.Text;
           end
           else begin
                if nap='1' then dir:=extractfiledir(OpenDialog3.FileName)
                else dir:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
           end;
           strat:=ust.ReadString('settings','electrodeStrategy','1');

           forcedirectories(dir); //create folders if needed
           if Form2.ListBox1.Count>0 then begin //if any electrodes exist in listbox1
               for f2i:=0 to Form2.ListBox1.Count-1 do begin //for every electrode family
                      //count based on virtual electrodes
                  for jjj:=0 to Form2.ListBox1.Count-1 do begin
                    chck:=SplitString(';',Form2.ListBox1.Items[jjj]);
                      if chck[8]<>'0' then aoe:=6
                      else if chck[7]<>'0' then aoe:=5
                      else if chck[6]<>'0' then aoe:=4
                      else if chck[5]<>'0' then aoe:=3
                      else if chck[4]<>'0' then aoe:=2
                      else if chck[3]<>'0' then aoe:=1;
                    end;
                  check_user:=check_user+aoe;

                   if Form2.CheckListBox1.Checked[f2i]=True then begin
                   tf_val:=SplitString(';',Form2.ListBox1.Items[f2i]);
                   f2amount_of_el:=0;   //count based on real electrodes
                   for f2j:=0 to Form2.ListBox2.Count-1 do begin
                       pe_val:=SplitString(';',Form2.ListBox2.Items[f2j]);
                       if tf_val[15]=pe_val[0] then inc(f2amount_of_el);
                   end;
                   //if aoe<>f2amount_of_el then ShowMessage('Warning! Difference between real and virtual amount of electrodes!'); //debug
                   if tf_val[17]<>'Z' then f00f:='6'
                   else f00f:='2';
                   //showmessage(tf_val[0]+' '+f00f); //debug (undersize type)
                   AssignFile(fut,dir+'\'+tf_val[21]+'.FUT');
                   rewrite(fut);                             //   name                            fp
                   write(fut,'TRON,05.01.0'+AnsiString(#10)+'F,'+tf_val[15]+',2,0,1,2,0.,0.,0.,'+tf_val[2]+',0.,0.,0.,0,'+inttostr(f2amount_of_el)+',0,1,0,0001,0,'+f00f+',2,1,1,0,0,1;0;2;0;2;0;4;3;1;$;2;'+matforagie(tf_val[1])+';T;1;'+AnsiString(#10));
                   AssignFile(f00,dir+'\'+tf_val[21]+'.F00');
                   rewrite(f00);
                   write(f00,'_TRON_,AGIEFUT_05.01.0'+AnsiSTring(#10)+'F,1,16678904,'+tf_val[15]+',2,0,1,2,0.,0.,0.,'+tf_val[2]+',0.,0.,0.,0,'+inttostr(f2amount_of_el)+',0,0,1,0,'+f00f+',2,1,1,0,0'+AnsiString(#10));
                   if Form2.ListBox2.Count>0 then begin // add physical electrodes
                       for f2j:=0 to Form2.ListBox2.Count-1 do begin //for every entry in physical electrode list
                          pe_val:=SplitString(';',Form2.ListBox2.Items[f2j]);
                          if tf_val[15]=pe_val[0] then begin
                              if pe_val[1]='R1' then begin
                                 phase2:='1';
                                 eip2:='1';
                                 elno:='1';
                              end
                              else if pe_val[1]='R2' then begin
                                  if ((strat<>'1') and (tf_val[6]<>'0')) then begin //second roughing el
                                     phase2:='1';
                                     eip2:='2';
                                     elno:='2';
                                  end
                                  else begin
                                     phase2:='2';
                                     eip2:='1';
                                     elno:='2';
                                  end;
                              end
                              else if pe_val[1]='R3' then begin
                                   if ((tf_val[6]='0') and (strat='3')) then begin // phase 3
                                      phase2:='3';
                                      eip2:='1';
                                      elno:='3';
                                   end
                                   else begin //phase 2
                                      if (strat='1') or ((tf_val[6]='0') and (strat='2')) then begin
                                         phase2:='2';
                                         eip2:='2';
                                         elno:='3';
                                      end
                                      else if ((strat='2') and (tf_val[6]<>'0')) then begin
                                         phase2:='2';
                                         eip2:='1';
                                         elno:='3';
                                      end;
                                   end;
                              end
                              else if pe_val[1]='R4' then begin
                                   if strat='3' then begin // phase 3
                                      phase2:='3';
                                      eip2:='1';
                                      elno:='4';
                                   end
                                   else if strat='2' then begin //phase 2
                                      phase2:='2';
                                      eip2:='2';
                                      elno:='4';
                                   end
                                   else if strat='1' then begin //phase 2
                                      phase2:='2';
                                      eip2:='3';
                                      elno:='4';
                                   end;
                              end
                              else if pe_val[1]='R5' then begin
                                 if strat='3' then begin
                                      phase2:='3';
                                      eip2:='2';
                                      elno:='5';
                                 end
                                 else if strat='2' then begin
                                      phase2:='2';
                                      eip2:='3';
                                      elno:='5'
                                 end
                                 else if strat='1' then begin
                                      phase2:='2';
                                      eip2:='4';
                                      elno:='5';
                                 end;
                              end
                              else if pe_val[1]='R6' then begin
                                 if strat='3' then begin
                                     phase2:='3';
                                     eip2:='3';
                                     elno:='6';
                                 end
                                 else if strat='2' then begin
                                     phase2:='2';
                                     eip2:='4';
                                     elno:='6';
                                 end
                                 else if strat='1' then begin
                                     phase2:='2';
                                     eip2:='5';
                                     elno:='6';
                                 end;
                              end;

                              if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                              else umode:='1';
                              if tf_val[16]='1' then le:='LE'+pe_val[9]
                              else le:='$';
                              if tf_val[17]<>'Z' then begin
                                 f00_sk:=pe_val[4];
                              end
                              else begin
                                   f00_sk:='0.';
                              end;
                              write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+pe_val[4]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                              write(fut,'U,R'+elno+',1,2,'+pe_val[9]+',3,'+pe_val[4]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,'+le+',F,0,0,T,0.,1,'+inttostr(strtoint(tf_val[16])+1)+',V'+elno+','+tf_val[15]+AnsiString(#10));
                              write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+pe_val[4]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                              write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+pe_val[9]+',3,'+pe_val[4]+','+pe_val[5]+','+pe_val[6]+','+pe_val[7]+','+pe_val[8]+',0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,'+le+',F,0,0,T,'+f00_sk+',1,'+inttostr(strtoint(tf_val[16])+1)+',1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                          end;
                       end;
                   end; //listbox2 - physical electrodes
                   CloseFile(fut);
                   CloseFile(f00);
                   AssignFile(fur,dir+'\'+tf_val[21]+'.FUR');
                   rewrite(fur);
                   write(fur,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME '+tf_val[15]+';'+AnsiString(#10)+'AGIE.USING_1 IMPORT COUNT_0 '+tf_val[21]+'.F00;');
                   CloseFile(fur);
                   AssignFile(f0r,dir+'\'+tf_val[21]+'.F0R');
                   rewrite(f0r);
                   write(f0r,'AGIE.VERSION 2,05.01.0;'+AnsiSTring(#10)+'.LONGNAME '+tf_val[15]+';');
                   CloseFile(f0r);
                   Form2.Label12.Caption:=Form2.Label12.Caption+'.';
                   end; //if checked
               end; //iterating through Listbox1
           end; //if any electrodes exist in listbox1

        end //if .mes file opened
        else begin //do electrodes based on Form2.ListBox1, without .mes file and listbox2 -- failsafe
             for i:=0 to Form2.ListBox1.Count-1 do begin
                 if Form2.CheckListBox1.Checked[i]=True then begin
                 tf_val:=SplitString(';',Form2.ListBox1.Items[i]);
                 if fold='1' then dir:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output')+'\'+Form1.Edit3.Text
                 else dir:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
                 strat:=ust.ReadString('settings','electrodeStrategy','1');
                  forcedirectories(dir); //create folders if needed

                 AssignFile(fur,dir+'\'+tf_val[21]+'.FUR');
                 rewrite(fur);
                 write(fur,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME '+tf_val[15]+';'+AnsiString(#10)+'AGIE.USING_1 IMPORT COUNT_0 '+tf_val[21]+'.F00;');
                 CloseFile(fur);
                 AssignFile(f0r,dir+'\'+tf_val[21]+'.F0R');
                 rewrite(f0r);
                 write(f0r,'AGIE.VERSION 2,05.01.0;'+AnsiSTring(#10)+'.LONGNAME '+tf_val[15]+';');
                 CloseFile(f0r);
                 if tf_val[8]<>'0' then amount_of_el:=6
                 else if tf_val[7]<>'0' then amount_of_el:=7
                 else if tf_val[6]<>'0' then amount_of_el:=4
                 else if tf_val[5]<>'0' then amount_of_el:=3
                 else if tf_val[4]<>'0' then amount_of_el:=2
                 else amount_of_el:=1;
                 AssignFile(fut,dir+'\'+tf_val[21]+'.FUT');
                 rewrite(fut);                             //   name                            fp
                 write(fut,'TRON,05.01.0'+AnsiString(#10)+'F,'+tf_val[0]+',2,0,1,2,0.,0.,0.,'+tf_val[2]+',0.,0.,0.,0,'+inttostr(amount_of_el)+',0,1,0,0001,0,2,2,1,1,0,0,1;0;2;0;2;0;4;3;1;$;2;'+matforagie(tf_val[1])+';T;1;'+AnsiString(#10));
                 AssignFile(f00,dir+'\'+tf_val[21]+'.F00');
                 rewrite(f00);
                 if tf_val[17]<>'Z' then begin
                      f00f:='6';   //undersize type - 6=jednakowo dolegly, 2=boczny
                     // f00_sk:=pe_val[4];    //wrong!
                   end
                   else begin
                        f00f:='2';
                      //
                   end;
                   f00_sk:='0.';
                 write(f00,'_TRON_,AGIEFUT_05.01.0'+AnsiSTring(#10)+'F,1,16678904,'+tf_val[15]+',2,0,1,2,0.,0.,0.,'+tf_val[2]+',0.,0.,0.,0,'+inttostr(amount_of_el)+',0,0,1,0,'+f00f+',2,1,1,0,0'+AnsiString(#10));
                 if strat='1' then begin
                    elno:='1';
                    phase2:='1';
                    eip2:='1';
                    if tf_val[17]<>'Z' then f00_sk:=tf_val[3];
                    //u1
                    if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                    else umode:='1';
                    write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[3]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                     write(fut,'U,R'+elno+',1,2,'+tf_val[9]+',3,'+tf_val[3]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                     write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[3]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                     write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[9]+',3,'+tf_val[3]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                     if amount_of_el>=2 then begin
                        elno:='2';
                        phase2:='2';
                        eip2:='1';                                                              //u1
                        if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                        else umode:='1';
                        if tf_val[17]<>'Z' then f00_sk:=tf_val[4];
                        write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[4]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                        write(fut,'U,R'+elno+',1,2,'+tf_val[10]+',3,'+tf_val[4]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                        write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[4]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                        write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[10]+',3,'+tf_val[4]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                        if amount_of_el>=3 then begin
                           elno:='3';
                           phase2:='2';
                           eip2:='2';                                                              //u1
                           if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                           else umode:='1';
                           if tf_val[17]<>'Z' then f00_sk:=tf_val[5];
                           write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[5]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                           write(fut,'U,R'+elno+',1,2,'+tf_val[11]+',3,'+tf_val[5]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                           write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[5]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                           write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[11]+',3,'+tf_val[5]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                           if amount_of_el>=4 then begin
                              elno:='4';
                              phase2:='2';
                              eip2:='3';                                                              //u1
                              if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                              else umode:='1';
                              if tf_val[17]<>'Z' then f00_sk:=tf_val[6];
                              write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[6]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                              write(fut,'U,R'+elno+',1,2,'+tf_val[12]+',3,'+tf_val[6]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                              write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[6]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                              write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[12]+',3,'+tf_val[6]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                              if amount_of_el>=5 then begin
                                 elno:='5';
                                 phase2:='2';
                                 eip2:='4';                                                              //u1
                                 if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                                 else umode:='1';
                                 if tf_val[17]<>'Z' then f00_sk:=tf_val[7];
                                 write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[7]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                                 write(fut,'U,R'+elno+',1,2,'+tf_val[13]+',3,'+tf_val[7]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                                 write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[7]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                                 write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[13]+',3,'+tf_val[7]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                                 if amount_of_el>=6 then begin
                                    elno:='6';
                                    phase2:='2';
                                    eip2:='5';                                                              //u1
                                    if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                                    else umode:='1';
                                    if tf_val[17]<>'Z' then f00_sk:=tf_val[8];
                                    write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[8]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                                    write(fut,'U,R'+elno+',1,2,'+tf_val[14]+',3,'+tf_val[8]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                                    write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[8]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                                    write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[14]+',3,'+tf_val[8]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                                 end;
                              end;
                           end;
                        end;
                     end;
                 end //strat 1
                 else if strat='2' then begin
                     elno:='1';
                    phase2:='1';
                    eip2:='1';                                                              //u1
                    if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                    else umode:='1';
                    if tf_val[17]<>'Z' then f00_sk:=tf_val[3];
                     write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[3]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                     write(fut,'U,R'+elno+',1,2,'+tf_val[9]+',3,'+tf_val[3]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                     write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[3]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                     write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[9]+',3,'+tf_val[3]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                     if amount_of_el>=2 then begin
                        if amount_of_el<4 then begin
                             elno:='2';
                             phase2:='2';
                             eip2:='1';
                        end
                        else begin
                             elno:='2';
                             phase2:='1';
                             eip2:='2';
                        end;
                        if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                        else umode:='1';
                        if tf_val[17]<>'Z' then f00_sk:=tf_val[4];
                        write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[4]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                        write(fut,'U,R'+elno+',1,2,'+tf_val[10]+',3,'+tf_val[4]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                        write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[4]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                        write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[10]+',3,'+tf_val[4]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                        if amount_of_el>=3 then begin
                           if amount_of_el=4 then begin
                              elno:='3';
                             phase2:='2';
                             eip2:='1';
                           end
                           else begin
                              elno:='3';
                             phase2:='2';
                             eip2:='2';
                            end;
                           if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                           else umode:='1';
                           if tf_val[17]<>'Z' then f00_sk:=tf_val[5];
                           write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[5]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                           write(fut,'U,R'+elno+',1,2,'+tf_val[11]+',3,'+tf_val[5]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                           write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[5]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                           write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[11]+',3,'+tf_val[5]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                           if amount_of_el>=4 then begin
                               elno:='4';
                             phase2:='2';
                             eip2:='2';
                             if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                             else umode:='1';
                             if tf_val[17]<>'Z' then f00_sk:=tf_val[6];
                              write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[6]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                              write(fut,'U,R'+elno+',1,2,'+tf_val[12]+',3,'+tf_val[6]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                              write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[6]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                              write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[12]+',3,'+tf_val[6]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                              if amount_of_el>=5 then begin
                                 elno:='5';
                                 phase2:='2';
                                 eip2:='3';
                                 if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                                 else umode:='1';
                                 if tf_val[17]<>'Z' then f00_sk:=tf_val[7];
                                 write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[7]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                                 write(fut,'U,R'+elno+',1,2,'+tf_val[13]+',3,'+tf_val[7]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                                 write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[7]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                                 write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[13]+',3,'+tf_val[7]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                                 if amount_of_el>=6 then begin
                                    elno:='6';
                                    phase2:='2';
                                    eip2:='4';
                                    if ((strtoint(elno)>1) and (strtoint(phase2)>=2)) then umode:='2'
                                    else umode:='1';
                                    if tf_val[17]<>'Z' then f00_sk:=tf_val[8];
                                    write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[8]+',1,'+umode+',0,1,0,0.,1,'+tf_val[15]+AnsiString(#10));
                                    write(fut,'U,R'+elno+',1,2,'+tf_val[14]+',3,'+tf_val[8]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase2+','+eip2+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[15]+AnsiString(#10));
                                    write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase2+','+eip2+','+tf_val[8]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                                    write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[14]+',3,'+tf_val[8]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,F,0,0,T,'+f00_sk+',1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                                 end;
                             end;
                           end;
                        end;
                     end;
                 end //strat 2
                 else if strat='3' then begin
                    ShowMessage('Strategia nieobslugiwana! (3)');
                 end; //strat 3
                 CloseFile(fut);
                 CloseFile(f00);
                 end; //if electrode checked
             end;
        end;

     if check_preset<>check_user then ShowMessage('Uwaga! Możliwa niezgodność w danych z preseta! ('+inttostr(check_preset)+' ≠ '+inttostr(check_user)+')');
     ProgressBar1.max:=40;
     ProgressBar1.Position:=0;
     randomize;
     str:='0123456789ABCDEFGHIJKLMNOPQRSTUVYZ';
     rname:='JOB';
     for i:=1 to 5 do rname:=rname + str[random(length(str))+1];  //random filename for program files
     str:='0123456789';
     rnumber:='1';
     for i:=1 to 3 do rnumber:=rnumber + str[random(length(str))+1];
     strat:=ust.ReadString('settings','electrodeStrategy','1');
     pozp:=ust.ReadString('settings','pp','30');
     ust.Free;
     ProgressBar1.Position:=10;
     AssignFile(tek,dir+'\'+rname+'.TEK');
     rewrite(tek);  // .tek file is empty, but required
     CloseFile(tek);
     AssignFile(ter,dir+'\'+rname+'.TER');
     rewrite(ter);
     write(ter,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME detal:'+rnumber+';'); //another useless random number required by the AGIEVISION
     CloseFile(ter);
     ProgressBar1.Position:=20;
     AssignFile(jor,dir+'\'+rname+'.JOR');
     rewrite(jor);
     write(jor,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME '+Edit3.Text+';'+AnsiString(#10)+'AGIE.USING_1 IMPORT COUNT_0 '+rname+'.TEK;'+AnsiString(#10)); //import empty technology file
     for i:=0 to Form2.ListBox1.Count-1 do begin //for every electrode in form2
         p_elval:=SplitString(';',Form2.ListBox1.Items[i]);
         if Form2.CheckListBox1.Checked[i]=True then begin //only when checked
            write(jor,'AGIE.USING_'+inttostr(i+2)+' IMPORT COUNT_1 '+p_elval[21]+'.FUT;'+AnsiString(#10)); //import every electrode for use in .JOB file
            last_using:=i+2;
         end;
     end;
      // new iso gen - per machining
      for i:=0 to Form1.ListBox9.Count-1 do begin
          if Form1.ListBox9.Items[i]<>'Z' then begin
            iname:='ISO';
            sleep(random(50*i)); //because otherwise random gives the same numbers for all iso files
            for j:=1 to 5 do iname:=iname + str[random(length(str))+1];
            inc(last_using);
            // num in listbox ; direction ; odsuniecie ; isoname ; using_nr
            ListBox10.Items.Add(inttostr(i)+';'+Form1.ListBox9.Items[i]+';'+Form1.ListBox11.Items[i]+';'+iname+';'+inttostr(last_using));
            write(jor,'AGIE.USING_'+inttostr(last_using)+' IMPORT COUNT_0 '+iname+'.ISO;'+AnsiString(#10)); //iso file for side eroding
          end;
      end;

      //make list of vdi names and bea numbers  (ItemIndex = bea_nr)
      for i:=0 to Form2.ListBox1.Count-1 do begin
          p_elval:=SplitString(';',Form2.ListBox1.Items[i]);
          if ListBox13.Count>0 then begin
              exists_in_list:=false;
              for j:=0 to ListBox13.Count-1 do begin
                  if p_elval[20]=ListBox13.Items[j] then exists_in_list:=True;
              end;
              if exists_in_list=false then ListBox13.Items.Add(p_elval[20]);
          end
          else ListBox13.Items.Add(p_elval[20]);
      end;
      //add each vdi once  TODO: move definitions to ini file
      for i:=0 to ListBox13.Count-1 do begin
          write(jor,'AGIE.BEA_'+inttostr(i+1)+' IMPORT COUNT_2 '+vdi_num_to_agie(ListBox13.Items[i])+',F,T,T,F,F;'+AnsiString(#10));
      end;
     CloseFile(jor);
     ProgressBar1.Position:=30;
     AssignFile(job,dir+'\'+rname+'.JOB');
     rewrite(job);
     if CheckBox3.Checked=True then gnam:='Group' //only create 1 group, to be copied on machine
     else gnam:='$';
     write(job,'TRON,05.01.0'+AnsiString(#10)+'J,$,x123,000,CNNPx,CNNPy,CNNCx,CNNCy,ZOOMPx,ZOOMPy,ZOOMCx,ZOOMCy,L,MinMax,Optmize'+AnsiString(#10)); //header

     write(job,'W,'+Edit3.Text+',4,000,'+ii_to_agie_pmat(ComboBox4.ItemIndex)+',AGIE.BEA_1,,1,2,'+pozp+',1,0,F,0,T,2,40,'+floattostr(strtofloat(Edit11.Text)*(-1))+','+floattostr(strtofloat(Edit12.Text)*(-1))+','+floattostr(strtofloat(Edit13.Text)*(-1))+',0.0,0.0,'+Edit14.Text+',0.0,0.0,0.0,0.0,0.0,100,100,50,-50,-50,-50,30,1,0,KW,0,F,0,F,0,F,0,0,F,1.3,T,0.8,F,$,$,1,$,$,$,$,2,TipoEdit2,TipoGraph,65536,0,0,0,65536,0,5000,5000,1,TipoGraph,65536,0,0,0,65536,0,10000,10000,1');
     if CheckBox3.Checked= True then write(job,AnsiString(#10)+'G,'+gnam+','+inttostr(ListBox2.Count)+',+0.0000,+0.0000,0.0,0,0,0.0,0,0,0,0,0,1,1,1,1,0,F,0,T,2,40,AGIE.BEA_1,,0,1,0,0,F,0,F,0,0,F,1.3,'+ii_to_agie_pmat(ComboBox4.ItemIndex)+',0,F,'+Edit3.Text+',$,2,1.0000,1.0000,2,65536,0,0,0,65536,0,10000,10000,1,TipoGraph,65536,0,0,0,65536,0,10000,10000,1');
     for i:=0 to ListBox2.Count-1 do begin //for every entry in table
         min_z:=200;
         for j:=0 to Form2.ListBox1.Count-1 do begin
             p_elval:=SplitString(';',Form2.ListBox1.Items[j]);
             min_z:=min(min_z,round(strtofloat(p_elval[7])));
             if trim(ListBox2.Items[i])=p_elval[0] then begin
               using_nr:=(j+2);
               if Form2.CheckListBox1.Checked[j]=True then do_this_el:=True
               else do_this_el:=False;
             end;
         end;
         kapiel:=40;
         if min_z<(strtofloat(ListBox6.Items[i])-20) then kapiel:=20; //TODO: test the exact value on machine
         if do_this_el=True then begin
           amount_of_el:=0;
            if Form2.ListBox2.Count>0 then begin //if there is data from preset
               for j:=0 to Form2.ListBox2.Count-1 do begin
                   p_elam:=SplitString(';',Form2.ListBox2.Items[j]);
                   if ListBox2.Items[i]=p_elam[10] then inc(amount_of_el);
               end;
            end
            else begin
                for j:=0 to Form2.ListBox1.Count-1 do begin
                    p_elam:=SplitString(';',Form2.ListBox1.Items[j]);
                    if ListBox2.Items[i]=p_elam[0] then begin
                      if p_elam[8]<>'0' then amount_of_el:=6
                      else if p_elam[7]<>'0' then amount_of_el:=7
                      else if p_elam[6]<>'0' then amount_of_el:=4
                      else if p_elam[5]<>'0' then amount_of_el:=3
                      else if p_elam[4]<>'0' then amount_of_el:=2
                      else if p_elam[3]<>'0' then amount_of_el:=1;
                    end;
                end;
            end;

            //match vdi bea number to electrode
             for j:=0 to Form2.ListBox1.Count-1 do begin
                    p_elam:=SplitString(';',Form2.ListBox1.Items[j]);
                    if ListBox2.Items[i]=p_elam[0] then begin
                       for k:=0 to ListBox13.Count-1 do begin
                          //showmessage('pos. '+inttostr(k)+': '+ListBox13.Items[k]+' - '+p_elam[16]);
                          if ListBox13.Items[k]=p_elam[20] then bea_nr:=k+1;
                      end;
                    end;
                end;
             //find out el properties for eroding direction
                      if ListBox9.Items[i]<>'Z' then begin
                           iusing:='error';
                           for k:=0 to ListBox10.Count-1 do begin
                               isoval:=SplitString(';',ListBox10.Items[k]);
                               if isoval[0]=inttostr(i) then iusing:=isoval[4];
                           end;
                           case ListBox9.Items[i] of
                                'X+': sp_coordsa:='-'+ListBox11.Items[i]+',0.0, 0';
                                '+X': sp_coordsa:='-'+ListBox11.Items[i]+',0.0, 0';
                                'X-': sp_coordsa:=ListBox11.Items[i]+',0.0, 0';
                                '-X': sp_coordsa:=ListBox11.Items[i]+',0.0, 0';
                                'Y+': sp_coordsa:='0.0,-'+ListBox11.Items[i]+', 0';
                                '+Y': sp_coordsa:='0.0,-'+ListBox11.Items[i]+', 0';
                                'Y-': sp_coordsa:='0.0,'+ListBox11.Items[i]+', 0';
                                '-Y': sp_coordsa:='0.0,'+ListBox11.Items[i]+', 0';
                           end;
                           //showmessage(sp_coordsa);  //debug
                           z_in_mach:=ListBox6.Items[i];
                           mach_add:=' 8, '+inttostr(amount_of_el)+'; 0; '+ListBox11.Items[i]+'; 0; 0; 0';
                           z_in_geo:='0';
                           if iusing='error' then ShowMessage('Wrong using number for iso file!');
                           geo_add:='2,2,1,1,0.0,2,1,1,AGIE.USING_'+iusing;
                           geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,2,0,0,0,0,0,45,0,1,3,0,0,0,0,1,F,F,1,0,1,0,0,0,0,0,0,0,T,1,1,2,3,4,0,0,0,0,0,0,F,2,0,0,-1,2,1,1,0,0,0,0,0,0';
                           only_vector:='T';
                           only_ret:='1';  //finishing shape
                           ksp:='3'; //kapiel od detalu
                           strange_number:='130';   //probably doesn't matter
                      end
                      else begin  // normal eroding (Z direction )
                           for j:=0 to Form2.ListBox1.Count-1 do begin
                               p_elam:=SplitString(';',Form2.ListBox1.Items[j]);
                               if p_elam[0]=ListBox2.Items[i] then mtd:=p_elam[19];
                           end;
                           sp_coordsa:='0.0000,0.0000,3.0000';
                           z_in_mach:='0.0';
                           mach_add:='0,0';
                           z_in_geo:=ListBox6.Items[i];
                           if strtofloat(z_in_geo)=0 then z_in_geo:='-0.001';
                           geo_add:='2,1,1,1,0.0,0,1,2,';
                           //get values for this electrode and set varribles to the coresponding EDM method
                           if mtd='1' then only_vector:='F'
                           else only_vector:='T';
                           if mtd='3' then only_ret:='2'
                           else only_ret:='1';  //finishing shape
                           if mtd='0' then      geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,5,0,0,0,0,0,45,1,1,3,0,0,0,0,1,F,T,1,0,1,0,0,0,0,0,0,0,F,1,1,2,3,4,0,0,0,0,0,0,F,1,0,0,0,1,1,1,0,0,0,0,0,0'  //3d
                           else if mtd='3' then geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,5,0,0,0,0,0,45,1,2,3,0,0,0,0,1,F,T,1,0,1,0,0,0,0,0,0,0,F,1,1,2,3,4,0,0,0,0,0,0,F,1,0,0,0,1,1,1,0,0,0,0,0,0'  //ret
                           else                 geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,5,0,0,0,0,0,45,1,1,3,0,0,0,0,1,F,T,1,0,1,0,0,0,0,0,0,0,F,1,1,2,3,4,0,0,0,0,0,0,F,1,0,0,0,1,1,1,0,0,0,0,0,0'; //cyl & vect
                           ksp:='2'; //kapiel od pkt start
                           strange_number:='138';  //probably doesn't matter
                      end;
            // end of eroding direction things

            if CheckBox3.Checked=True then write(job,AnsiString(#10)+'R,Mach'+inttostr(i)+','+ListBox3.Items[i]+','+ListBox4.Items[i]+','+z_in_mach+',0,0,'+ListBox5.Items[i]+',0,0,0,0,0,F,F,1,1,0,F,0,T,'+ksp+','+inttostr(kapiel)+',AGIE.USING_'+inttostr(using_nr)+',0,Geo_Mach'+inttostr(i)+',1,'+ii_to_agie_pmat(ComboBox4.ItemIndex)+',AGIE.BEA_'+inttostr(bea_nr)+',F,,StartPoint,6,,-1,1,0,0,0,0,T,5,F,T,T,T,F,0,0,0,1,0,'+mach_add+',0,0,0,0,1,0,0,0,134,'+gnam+','+Edit3.Text+',$,1.0000,1.0000,1,65536,0,0,0,65536,0,10000,10000,1'+AnsiString(#10))
            else                           write(job,AnsiString(#10)+'A,Mach'+inttostr(i)+','+ListBox3.Items[i]+','+ListBox4.Items[i]+','+z_in_mach+',0,0,'+ListBox5.Items[i]+',0,0,0,0,0,F,F,1,1,0,F,0,T,'+ksp+','+inttostr(kapiel)+',AGIE.USING_'+inttostr(using_nr)+',0,Geo_Mach'+inttostr(i)+',1,'+ii_to_agie_pmat(ComboBox4.ItemIndex)+',AGIE.BEA_'+inttostr(bea_nr)+',F,,StartPoint,5,,-1,1,0,0,0,0,T,5,F,T,T,T,F,0,0,0,1,0,'+mach_add+',0,0,0,0,1,0,0,0,'+strange_number+','+Edit3.Text+',$,1.0000,1.0000,1,64420,11397,0,-11397,64420,0,11000,11000,1'+AnsiString(#10));
            write(job,'E,Geo_Mach'+inttostr(i)+',T,T,F,1,'+only_vector+','+geo_add+',0,0,'+z_in_geo+',0,0,0,T,0,0.0,0.0,F,'+only_ret+',0,0,0,0,0,0,0,360,0,F,'+geo_add2+',Mach'+inttostr(i)+','+gnam+','+Edit3.Text+',$');
            //next lines for every physical electrode of this family (copy of .FUT information basically, but in slightly different format, cannot be copied)

            for j:=1 to 6 do begin
                phase[j]:=0;
                eip[j]:=0;
            end;
            if strat='1' then begin
               for j:=1 to amount_of_el do begin
                   if j=1 then begin
                      phase[j]:=1;
                      eip[j]:=1;
                   end
                   else begin
                        phase[j]:=2;
                        eip[j]:=(j-1);
                   end;
               end;
            end
            else if strat='2' then begin
                 for j:=1 to amount_of_el do begin
                     if j=1 then begin
                        phase[j]:=1;
                        eip[j]:=1;
                     end
                 else if j=2 then begin
                      if amount_of_el=4 then begin
                         phase[j]:=1;
                         eip[j]:=2;
                      end
                      else begin
                           phase[j]:=2;
                           eip[j]:=1;
                      end;
                 end
                 else if j=3 then begin
                      if amount_of_el=4 then begin
                         phase[j]:=2;
                         eip[j]:=1;
                      end
                      else begin
                           phase[j]:=2;
                           eip[j]:=2;
                      end;
                 end
                 else begin //j=4,5,6
                    phase[j]:=2;
                    eip[j]:=(j-2);
                 end;
              end;
            end
            else if strat='3' then begin //not working for 6 electrodes!
                 for j:=1 to amount_of_el do begin
                     if j=1 then begin
                        phase[j]:=1;
                        eip[j]:=1;
                     end
                     else begin
                          if amount_of_el=4 then begin
                             phase[j]:=(j-1);
                             if j=2 then eip[j]:=2
                             else eip[j]:=1;
                          end
                          else begin
                               phase[j]:=j;
                               eip[j]:=1;
                          end;
                     end;
                 end;
             end;
             for j:=1 to amount_of_el do write(job,AnsiString(#10)+'p,0,'+inttostr(j)+',0,'+inttostr(phase[j])+','+inttostr(eip[j])+',0,3,32,127,0,1,0,1,10,35,35,1,5,0,20,50,50,1,0,0,0,0');
             for j:=1 to amount_of_el do write(job,AnsiString(#10)+'l,1,'+inttostr(j)+',0,'+inttostr(phase[j])+','+inttostr(eip[j])+',0,0,0,0,0,0,0');
             for j:=1 to amount_of_el do write(job,AnsiString(#10)+'a,2,'+inttostr(j)+',0,'+inttostr(phase[j])+','+inttostr(eip[j])+',0,0,1.000,1.000,2,0,5,0.020,0.008,0');
             write(job,AnsiString(#10)+'I,StartPoint,'+sp_coordsa+',0,3.0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,T,F,F,Mach'+inttostr(i)+','+gnam+','+Edit3.Text+',$');
         end; //do_this_el
     end;

     CloseFile(job);
     if ListBox10.Count>0 then begin //create iso files
        for i:=0 to ListBox10.Count-1 do begin
            isoval:=SplitString(';',ListBox10.Items[i]);
            AssignFile(iso,dir+'\'+isoval[3]+'.ISO');
            rewrite(iso);
            //if AnsiContainsStr(isoval[2],'.') then littledot:='.'
            //else littledot:='';
            littledot:='';
            case isoval[1] of
                 'X+': sp_coords:=' X-'+isoval[2]+littledot+' Y0.0';
                 '+X': sp_coords:=' X-'+isoval[2]+littledot+' Y0.0';
                 'X-': sp_coords:=' X'+isoval[2]+littledot+' Y0.0';
                 '-X': sp_coords:=' X'+isoval[2]+littledot+' Y0.0';
                 'Y+': sp_coords:=' X0.0 Y-'+isoval[2]+littledot;
                 '+Y': sp_coords:=' X0.0 Y-'+isoval[2]+littledot;
                 'Y-': sp_coords:=' X0.0 Y'+isoval[2]+littledot;
                 '-Y': sp_coords:=' X0.0 Y'+isoval[2]+littledot;
            end;
            case isoval[1] of
                 'X+': drbok:=' X'+isoval[2]+littledot;
                 '+X': drbok:=' X'+isoval[2]+littledot;
                 'X-': drbok:=' X-'+isoval[2]+littledot;
                 '-X': drbok:=' X-'+isoval[2]+littledot;
                 'Y+': drbok:=' Y'+isoval[2]+littledot;
                 '+Y': drbok:=' Y'+isoval[2]+littledot;
                 'Y-': drbok:=' Y-'+isoval[2]+littledot;
                 '-Y': drbok:=' Y-'+isoval[2]+littledot;
            end;

            write(iso,'N0G00'+sp_coords+'Z 0.;'+AnsiString(#10)+'N1G91;'+AnsiString(#10)+'N2G01'+drbok+';'+AnsiString(#10)+'N3M02;'+AnsiString(#10));
            CloseFile(iso);
            AssignFile(isr,dir+'\'+isoval[3]+'.ISR');
            rewrite(isr); //isr is the metadata file required for every iso
            write(isr,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME Machiso'+isoval[4]+';');
            CloseFile(isr);
        end;
     end;
     ProgressBar1.Position:=40;
     logToFile('program sent to Agie HP ('+Edit3.Text+')','OK');
     Form9.ListBox1.Clear;
     for cvdi9:=0 to Form1.ListBox13.Count-1 do Form9.ListBox1.Items.Add(Form1.ListBox13.Items[cvdi9]);
     Form9.Label2.Caption:=Edit3.Text;
     if Form9.ShowModal=mrOK then logToFile('opened folder','INF'); //results form
   end
   else ShowMessage('Uzupełnij dane elektrod.');
end;

procedure TForm1.Button2Click(Sender: TObject); //elektrody...
var j,k:integer;
  el_exists:boolean;
begin
 if ListBox2.Count>0 then begin
   for j:=0 to (ListBox2.Count-1) do begin //for each position in table
     el_exists:=False; //mark electrode as not exist
     if Form2.CheckListBox1.Count>0 then begin
        for k:=0 to (Form2.CheckListBox1.Count-1) do begin //for each already known electrode
            if Form2.CheckListBox1.Items[k]=trim(ListBox2.Items[j]) then el_exists:=True; //mark electrode that already exist
        end;
     end;
     if el_exists=False then begin //if electrode is marked not existing
        Form2.CheckListBox1.Items.Add(trim(ListBox2.Items[j])); //add to visible list
        Form2.CheckListBox1.Checked[(Form2.CheckListBox1.Count-1)]:=True;
        if CheckBox1.Checked=False then begin
           if CheckBox4.Checked=False then Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ListBox7.Items[j]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5;0;'+ListBox12.Items[j]) //add parameters to invisible list
           else Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ListBox7.Items[j]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5;0;'+vdi_ii_to_nr(ComboBox2.ItemIndex)); // replace vdi
        end
        else begin
            if CheckBox4.Checked=False then Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ComboBox1.Items[ComboBox1.ItemIndex]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5;0;'+ListBox12.Items[j])  // replace material if choosen so
            else Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ComboBox1.Items[ComboBox1.ItemIndex]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5;0;'+vdi_ii_to_nr(ComboBox2.ItemIndex));  // replace material if choosen so + replace vdi
        end;
     end;
   end;
   Form2.CheckListBox1.ItemIndex:=0; //set position to first electrode
   Form2.Label11.Caption:=Edit3.Text; //copy program name
   Form2.editel(Form1);    // load values of first electrode into fields for editing
   ProgressBar1.Position:=0; //reset progress bar
   ProgressBar1.Max:=(Form2.ListBox1.Count)*10; //set max as number of electrodes times ten
   if Form2.ShowModal=mrOK then begin //show filled Form2
      //change electrode material, and fP
      for j:=0 to Form2.ListBox1.Count-1 do begin

      end;
   end;
 end;
end;

procedure TForm1.Button3Click(Sender: TObject); //usuń dane el.
begin
  Form2.CheckListBox1.Clear;
  Form2.ListBox1.Clear;
  Form2.Label13.Caption:='ready';
  setChanged(true);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  logToFile('searched for next table in same drawing','INF');
  Button1.Click;
end;

procedure TForm1.Button5Click(Sender: TObject);
var di:integer;
begin
   if ListBox2.ItemIndex>=0 then begin
      di:=ListBox2.ItemIndex;
      ListBox2.Items.Delete(di);
      ListBox3.Items.Delete(di);
      ListBox4.Items.Delete(di);
      ListBox5.Items.Delete(di);
      ListBox6.Items.Delete(di);
      ListBox7.Items.Delete(di);
      ListBox8.Items.Delete(di);
      ListBox9.Items.Delete(di);
      ListBox11.Items.Delete(di);
      ListBox12.Items.Delete(di);
      ListBox2.ItemIndex:=-1;
   end;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i,xc,yc,j,factor:integer;
  maxdim:real;
  recta:TRect;
begin
   Form1.WindowState:=wsMaximized;
   Button7.Left:=20;
   Button7.Top:=5;
   Button8.Visible:=True;
   Button8.Top:=5;
   Button8.Left:=Button7.Left+Button7.Width+10;
   Button8.Caption:='Koniec';
   ListBox2.Visible:=False;
   ListBox3.Visible:=False;
   ListBox4.Visible:=False;
   ListBox5.Visible:=False;
   ListBox6.Visible:=False;
   ListBox7.Visible:=False;
   ListBox8.Visible:=False;
   ListBox9.Visible:=False;
   //ListBox10.Visible:=False;  // side eroding table - made not visible at all.
   ListBox11.Visible:=False;
   ListBox12.Visible:=False;
   //ListBox13.Visible:=False; // vdi used - visible one moved to another form
   CheckBox1.Visible:=False;
   //CheckBox2.Visible:=False;  // reversed checkbox - now done automatically
   CheckBox3.Visible:=False;
   CheckBox4.Visible:=False;
   CheckBox8.Visible:=False; //dodaj skaner
   Button2.Visible:=False;
   Button3.Visible:=False;
   Button4.Visible:=False;
   //Button14.Visible:=False; //old wyslij
   BitBtn1.Visible:=False;
   BitBtn2.Visible:=False;
   BitBtn3.Visible:=False;
   BitBtn4.Visible:=False;
   BitBtn5.Visible:=False;
   BitBtn6.Visible:=False;
   BitBtn7.Visible:=False;
   BitBtn8.Visible:=False;
   BitBtn9.Visible:=False;
   ProgressBar1.Visible:=False;
   Label1.Visible:=False;
   Label2.Visible:=False;
   Label3.Visible:=False;
   Label4.Visible:=False;
   Label5.Visible:=False;
   Label6.Visible:=False;
   Label7.Visible:=False;
   Label8.Visible:=False;
   Label9.Visible:=False;
   Label10.Visible:=False;
   Label11.Visible:=False;
   Label14.Visible:=False;
   Label15.Visible:=False;
   Label16.Visible:=False;
   Label17.Visible:=False;
   Label22.Visible:=False;
   Label23.Visible:=False;
   LabeledEdit1.Visible:=False;
   ComboBox1.Visible:=False;
   ComboBox2.Visible:=False;
   ComboBox3.Visible:=False;
   ComboBox4.Visible:=False;
   COmboBox5.Visible:=False;
   Edit1.Visible:=False;
   Edit2.Visible:=False;
   Edit3.Visible:=False;
   Edit4.Visible:=False;
   Edit5.Visible:=False;
   Edit6.Visible:=False;
   //Edit7.Visible:=False;
   Edit8.Visible:=False;
   Edit9.Visible:=False;
   Edit10.Visible:=False;
   Edit15.Visible:=False;
   Edit16.Visible:=False;
   GroupBox1.Visible:=False;
   //Button8.Left:=(floor(Panel1.Width/2)-floor(Button8.Width/2));
   //Button8.Top:=5;
   PaintBox1.Top:=10+Button7.Height;
   PaintBox1.Height:=Form1.Height-Button7.Height-50;
   PaintBox1.Left:=15;
   PaintBox1.Width:=Form1.Width-30;
   logToFile('Grafickeck clicked','INF');

   maxdim:=0;
   for i:=0 to ListBox3.Count-1 do begin
         if abs(strtofloat(ListBox3.Items[i]))>maxdim then maxdim:=abs(strtofloat(ListBox3.Items[i]))
     end;
    for i:=0 to ListBox4.Count-1 do begin
         if abs(strtofloat(ListBox4.Items[i]))>maxdim then maxdim:=abs(strtofloat(ListBox4.Items[i]))
     end;
    maxdim:=floor(maxdim)+5;
    Form1.Color:=clNavy;
    with PaintBox1.Canvas do
    begin
        Repaint;
        Pen.Style:=psSolid;
        Brush.Color:=clNavy;
        Pen.Color:=clNavy;
        Rectangle(0,0,PaintBox1.Width,PaintBox1.Height);
        Brush.Color:=clRed;
        MoveTo(floor(PaintBox1.Width/2),0);
        Pen.Color:=clRed;
        LineTo(floor(PaintBox1.Width/2),floor(PaintBox1.Height));
        //LineTo(floor(PaintBox1.Width/2)+60,floor(PaintBox1.Height/2)-10);
        MoveTo(0,floor(PaintBox1.Height/2));
        LineTo(floor(PaintBox1.Width),floor(PaintBox1.Height/2));
        j:=0;
        factor:=0;

        repeat
              inc(factor);
        until (TextWidth('-3')*2)<((factor*floor(PaintBox1.Height/2))/maxdim); //fit dimensions to the screen
        maxdim:=maxdim*factor;
         //Refresh;

        Pen.Color:=clRed;
        Brush.Color:=clRed;
        Font.Color:=clRed;
        Brush.Style:=bsClear;
        Font.Height:=48;
        TextOut(PaintBox1.Width-80,(floor(PaintBox1.Height/2))-50,'X');
        TextOut(floor(PaintBox1.Width/2)+20,10,'Y');
        repeat
              j:=j+factor;
              Pen.Color:=clRed;       // this has to be
              Brush.Color:=clRed;     // inside the loop
              Font.Color:=clRed;      // otherwise full rectangles are drawn
              Brush.Style:=bsClear;   // instead of text
              Font.Height:=16;        // its werid, ik
              MoveTo(floor(PaintBox1.Width/2)+floor((j*factor*(PaintBox1.Height/2))/maxdim),floor(PaintBox1.Height/2)+5);
              LineTo(floor(PaintBox1.Width/2)+floor((j*factor*(PaintBox1.Height/2))/maxdim),floor(PaintBox1.Height/2)-5);
              TextOut(floor(PaintBox1.Width/2)+floor((j*factor*(PaintBox1.Height/2))/maxdim)-(TextWidth(inttostr(j))div 2),floor(PaintBox1.Height/2)+15,inttostr(j));
              MoveTo(floor(PaintBox1.Width/2)-floor((j*factor*(PaintBox1.Height/2))/maxdim),floor(PaintBox1.Height/2)+5);
              LineTo(floor(PaintBox1.Width/2)-floor((j*factor*(PaintBox1.Height/2))/maxdim),floor(PaintBox1.Height/2)-5);
              TextOut(floor(PaintBox1.Width/2)-floor((j*factor*(PaintBox1.Height/2))/maxdim)-(TextWidth('-'+inttostr(j))div 2),floor(PaintBox1.Height/2)+15,'-'+inttostr(j));
              MoveTo(floor(PaintBox1.Width/2)+5,floor(PaintBox1.Height/2)+floor((j*factor*(PaintBox1.Height/2))/maxdim));
              LineTo(floor(PaintBox1.Width/2)-5,floor(PaintBox1.Height/2)+floor((j*factor*(PaintBox1.Height/2))/maxdim));
              TextOut(floor(PaintBox1.Width/2)-10-TextWidth('-'+inttostr(j)),floor(PaintBox1.Height/2)+floor((j*factor*(PaintBox1.Height/2))/maxdim)-(TextHeight('-'+inttostr(j))div 2),'-'+inttostr(j));
              MoveTo(floor(PaintBox1.Width/2)+5,floor(PaintBox1.Height/2)-floor((j*factor*(PaintBox1.Height/2))/maxdim));
              LineTo(floor(PaintBox1.Width/2)-5,floor(PaintBox1.Height/2)-floor((j*factor*(PaintBox1.Height/2))/maxdim));
              TextOut(floor(PaintBox1.Width/2)-10-TextWidth(inttostr(j)),floor(PaintBox1.Height/2)-floor((j*factor*(PaintBox1.Height/2))/maxdim)-(TextHeight('-'+inttostr(j))div 2),inttostr(j));
        until j>maxdim;
        Pen.Color:=clYellow;
        Brush.Color:=clYellow;
        Font.Color:=clYellow;
        Brush.Style:=bsClear;
        Font.Height:=16;
        for i:=0 to ListBox2.Count-1 do begin
            xc:=floor((strtofloat(ListBox3.Items[i])*(PaintBox1.Height/2))/maxdim)*factor;
            yc:=floor((strtofloat(ListBox4.Items[i])*(PaintBox1.Height/2))/maxdim)*factor;
            Ellipse(floor(PaintBox1.Width/2)-5+xc,floor(PaintBox1.Height/2)-5-yc,floor(PaintBox1.Width/2)+5+xc,floor(PaintBox1.Height/2)+5-yc);
            MoveTo(floor(PaintBox1.Width/2)+xc,floor(PaintBox1.Height/2)-yc);
            LineTo(floor(PaintBox1.Width/2)+xc+round(sin(DegToRad(strtofloat(ListBox5.Items[i])))*20),floor(PaintBox1.Height/2)-yc+round(cos(DegToRad(strtofloat(ListBox5.Items[i])))*20));
            //litletriangle
            //MoveTo(floor(PaintBox1.Width/2)+xc+round(sin(DegToRad(strtofloat(ListBox5.Items[i])))*6),floor(PaintBox1.Height/2)-yc+round((-1)*cos(DegToRad(strtofloat(ListBox5.Items[i])))*6));
            //below line is wrong
            //LineTo(floor(PaintBox1.Width/2)+xc+round(sin(DegToRad(strtofloat(ListBox5.Items[i])))*6),floor(PaintBox1.Height/2)-yc+round((-1)*cos(DegToRad(strtofloat(ListBox5.Items[i])))*6));
            TextOut(floor(PaintBox1.Width/2)+10+xc,floor(PaintBox1.Height/2)-yc-10,ListBox2.Items[i]);

        end;
        Refresh;
    end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var ust:TIniFile;
  path,hp,x400,certa:string;
begin
 ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   Form1.Color:=clDefault;
  Form1.WindowState:=wsNormal;
   Button7.Left:=302;
   Button7.Top:=88;
   Button8.Visible:=False;
   hp:=ust.readString('settings','exportAgieHP','0');
   x400:=ust.readString('settings','exportX400','0');
   certa:=ust.readString('settings','exportCERTA','0');
   //Button8.Top:=5;
   //Button8.Left:=Button7.Left+Button7.Width+10;
   //Button8.Caption:='Koniec';
   ListBox2.Visible:=True;
   ListBox3.Visible:=True;
   ListBox4.Visible:=True;
   ListBox5.Visible:=True;
   ListBox6.Visible:=True;
   ListBox7.Visible:=True;
   ListBox8.Visible:=True;
   ListBox9.Visible:=True;
   //ListBox10.Visible:=True;
   ListBox11.Visible:=True;
   ListBox12.Visible:=True;
   //ListBox13.Visible:=True;
   CheckBox1.Visible:=True;
   CheckBox3.Visible:=True;
   CheckBox4.Visible:=True;
   if x400='1' then CheckBox8.Visible:=True;
   Button2.Visible:=True;
   Button3.Visible:=True;
   Button4.Visible:=True;
   //Button14.Visible:=True;

   BitBtn1.Visible:=True;
   BitBtn2.Visible:=True;
   BitBtn3.Visible:=True;
   BitBtn4.Visible:=True;
   if hp='1' then BitBtn5.Visible:=True;
   if certa='1' then BitBtn6.Visible:=True;
   BitBtn7.Visible:=True;
   BitBtn8.Visible:=True;
   if x400='1' then BitBtn9.Visible:=True;
   ProgressBar1.Visible:=True;
   Label1.Visible:=True;
   Label2.Visible:=True;
   Label3.Visible:=True;
   Label4.Visible:=True;
   Label4.Visible:=True;
   Label5.Visible:=True;
   Label6.Visible:=True;
   Label7.Visible:=True;
   Label8.Visible:=True;
   Label9.Visible:=True;
   Label10.Visible:=True;
   Label11.Visible:=True;
   Label14.Visible:=True;
   Label15.Visible:=True;
   Label16.Visible:=True;
   path:=ust.readstring('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
   Label17.Visible:=directoryExists(path+'\'+Edit3.Text);
   Label22.Visible:=True;
   Label23.Visible:=True;
   if x400='1' then LabeledEdit1.Visible:=True;
   ComboBox1.Visible:=True;
   ComboBox2.Visible:=True;
   ComboBox3.Visible:=True;
   ComboBox4.Visible:=True;
   COmboBox5.Visible:=True;
   Edit1.Visible:=True;
   Edit2.Visible:=True;
   Edit3.Visible:=True;
   Edit4.Visible:=True;
   Edit5.Visible:=True;
   Edit6.Visible:=True;
   //Edit7.Visible:=True;
   Edit8.Visible:=True;
   Edit9.Visible:=True;
   Edit10.Visible:=True;
   Edit15.Visible:=True;
   Edit16.Visible:=True;
   GroupBox1.Visible:=True;
   ust.Free;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin

end;

procedure TForm1.chkeckTypedDir(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var is_ok:boolean;
begin
  is_ok:=false;
  case (Sender as TEdit).Text of
       'Z': is_ok:=True;
       'X+': is_ok:=True;
       'X-': is_ok:=True;
       'Y+': is_ok:=True;
       'Y-': is_ok:=True;
       '+X': is_ok:=True;
       '-X': is_ok:=True;
       '+Y': is_ok:=True;
       '-Y': is_ok:=True;
  end;
  if is_ok=false then (Sender as TEdit).Color:=clRed
   else (Sender as TEdit).Color:=clDefault;
  is_ok:=false;
  case (Sender as TEdit).Text of
       'X+': is_ok:=True;
       'X-': is_ok:=True;
       'Y+': is_ok:=True;
       'Y-': is_ok:=True;
       '+X': is_ok:=True;
       '-X': is_ok:=True;
       '+Y': is_ok:=True;
       '-Y': is_ok:=True;
  end;
  Edit10.Enabled:=is_ok;

end;

procedure TForm1.comatodot(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if AnsiContainsStr((Sender as TEdit).Text,',') then begin
        (Sender as TEdit).Text:=StringReplace((Sender as TEdit).Text,',','.',[rfReplaceAll]);
        (Sender as TEdit).SelStart:=high(Integer);
     end;
  if isSignedFloat((Sender as TEdit).Text) then (Sender as TEdit).color:=clDefault
  else (Sender as TEdit).color:=clRed;
  setChanged(true);
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin

end;

procedure TForm1.ComboBox4Change(Sender: TObject);
begin

end;

procedure TForm1.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  MenuItem8Click(Form1);
  logToFile('Exit','OK');
end;

procedure TForm1.FormCreate(Sender: TObject);
var ust:TIniFile;

  i:integer;
  dms,mcouts,mpouts:string;
  mcurrent,mprev:TDCP_sha256;
  mcout,mpout:array[0..31] of byte;
  sl2:TStringList;
begin
    sizeset:=false;
    Form1.resizemainf(Form1);
    sw_ver:='18';
    sw_ver_minor:='1';
    ImageList1.AddLazarusResource('open-file');  //0
    ImageList1.AddLazarusResource('new file');   //1
    ImageList1.AddLazarusResource('Help');       //2
    ImageList1.AddLazarusResource('Save');       //3
    ImageList1.AddLazarusResource('Settings');   //4
    ImageList1.AddLazarusResource('Information');//5
    ImageList1.AddLazarusResource('dxf-file');   //6
    ImageList1.AddLazarusResource('File-info');  //7
    Imagelist1.AddLazarusResource('seb_ic');     //8
    Imagelist1.AddLazarusResource('Printer');    //9

    BitBtn1.LoadGlyphFromLazarusResource('Copy');
    BitBtn2.LoadGlyphFromLazarusResource('Remove');
    BitBtn3.LoadGlyphFromLazarusResource('Edit-validated');
    BitBtn4.LoadGlyphFromLazarusResource('Add');
    sl2:=TStringList.Create;
    sl2.Add('Wyślij HP');
    //sl2.Add('Hyperspark');
    //SetWindowLong(BitBtn5.Handle, GWL_STYLE, BS_MULTILINE);

    BitBtn5.Caption:=sl2.Text;
    BitBtn6.Caption:='Wyślij CERTA';
    Edit15.Text:=formatdatetime('yyyy-mm-dd',Now());
    end_table_line:=0;
    plsr12sc:=False;
    tableno:=0; //abount of tables
    errorlevel:=0; //for dxf
    ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    SpinEdit1.Value:=strtoint(ust.ReadString('settings','defaultNoOfRows','10'));
    OpenDialog3.InitialDir:=ust.ReadString('settings','pathMES','C:\korekty\AGIEVISION_2');
    OpenDialog1.InitialDir:=ust.ReadString('settings','pathDXF','C:\Intel\LazarusPortable\dxf test');
    SaveDialog1.InitialDir:=ust.ReadString('settings','pathVDM','C:\VDM');
    OpenDialog2.InitialDir:=ust.ReadString('settings','pathVDM','C:\VDM');
    OpenDialog4.InitialDir:=ust.ReadString('settings','pathCSV','C:\VDM');
    SaveDialog2.InitialDir:=ust.ReadString('settings','pathCSV','C:\VDM');
    SaveDialog3.InitialDir:=ust.ReadString('settings','pathXMLJ','C:\XMLJ');
    ComboBox5.ItemIndex:=elmatii_input(ust.ReadString('settings','defaultElectrodeMaterial','Graphite2'));
    Edit10.Text:=ust.ReadString('settings','defaultSideOffset','5');
    Edit13.Text:=ust.ReadString('settings','defaultZOffset','0');
    ComboBox4.ItemIndex:=strtoint(ust.ReadString('settings','defaultPieceMaterial','0'));
    dms:=ust.ReadString('dms','dms','error');

    mcurrent:=TDCP_sha256.Create(Form1);
    mcurrent.Init;
    mcurrent.UpdateStr(inttostr(YearOf(Now))+inttostr(MonthOfTheYear(Now)));
    mcurrent.Final(mcout);
    mprev:=TDCP_sha256.Create(Form1);
    mprev.Init;
    if MonthOfTheYear(Now)>1 then mprev.UpdateStr(inttostr(YearOf(Now))+inttostr(MonthOfTheYear(Now)-1))
    else mprev.UpdateStr(inttostr(YearOf(Now)-1)+inttostr(12));
    mprev.Final(mpout);
    mcouts:='';
    mpouts:='';
    for i:=0 to 31 do mcouts:=mcouts+inttostr(mcout[i]);
    for i:=0 to 31 do mpouts:=mpouts+inttostr(mpout[i]);
    if ((mcouts<>dms) and (mpouts<>dms)) then begin
       logToFile('bad license','ERR');
       Application.Terminate;
    end;
    if mcouts<>dms then Label13.Visible:=True;

    Form1.Width:=1002;
    Form1.Height:=460; // old356

    //export buttons positioning
    if ust.ReadString('settings','exportAgieHP','1')='1' then begin
        BitBtn5.Visible:=True;
        BitBtn5.Left:=8;
        BitBtn5.Top:=250;
        if ust.ReadString('settings','exportX400','1')='1' then begin
            BitBtn9.Visible:=True;
            LabeledEdit1.Visible:=True;
            Form1.Height:=460;
            BitBtn9.Left:=192;
            BitBtn9.Top:=250;
            if ust.ReadString('settings','exportCERTA','1')='1' then begin
                BitBtn6.Visible:=True;
                BitBtn6.Top:=344;
                BitBtn6.Left:=192;
            end
            else begin
                BitBtn6.Visible:=False;
            end;
        end
        else begin
            BitBtn9.Visible:=False;
            LabeledEdit1.Visible:=False;
            Form1.Height:=356;
            if ust.ReadString('settings','exportCERTA','1')='1' then begin
                BitBtn6.Visible:=True;
                BitBtn6.Top:=250;
                BitBtn6.Left:=192;
            end
            else begin
                BitBtn6.Visible:=False;
            end;
        end;
    end
    else begin  //no hyperspark
        BitBtn5.Visible:=False;
        if ust.ReadString('settings','exportX400','1')='1' then begin
            BitBtn9.Visible:=True;
            LabeledEdit1.Visible:=True;
            Form1.Height:=460;
            BitBtn9.Top:=250;
            BitBtn9.Left:=8;
            if ust.ReadString('settings','exportCERTA','1')='1' then begin
                BitBtn6.Visible:=True;
                BitBtn6.Top:=250;
                BitBtn6.Left:=192;
            end
            else begin  //only x400
                BitBtn6.Visible:=False;
                LabeledEdit1.Top:=300;
                LabeledEdit1.Left:=192;
                Form1.Height:=356;
            end;
        end
        else begin
            BitBtn9.Visible:=False;
            LabeledEdit1.Visible:=False;
            Form1.Height:=356;
            if ust.ReadString('settings','exportCERTA','1')='1' then begin //only certa
                BitBtn6.Visible:=True;
                BitBtn6.Top:=250;
                BitBtn6.Left:=8;
            end
            else begin //nothing
                BitBtn6.Visible:=False;
            end;
        end;
    end;
    //button positioning end
    ust.Free;
    logToFile('program opened','OK');
    setChanged(False);

end;

procedure TForm1.FormPaint(Sender: TObject);
begin

end;

procedure TForm1.handleparams(Sender: TObject);
begin
  if ParamCount>0 then begin
         //showmessage(ExtractFileExt(ParamStr(1)));
         if ExtractFileExt(ParamStr(1))='.edf' then load_edf(ParamStr(1))
         else if ExtractFileExt(ParamStr(1))='.csv' then load_csv(ParamStr(1))
         else begin
         OpenDialog1.FileName:=ParamStr(1);
         Button1.Click;
         end;
    end;
end;

procedure TForm1.hp2(Sender: TObject; const FileNames: array of String);
begin
   OpenDialog1.FileName:=FileNames[1];
   Button1.Click;
end;


procedure TForm1.loadpos(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var is_ok:boolean;
begin
  if (Sender as TListBox).ItemIndex>=0 then begin
  ListBox2.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox3.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox4.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox5.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox6.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox7.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox8.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox9.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox11.ItemIndex:=(Sender as TListBox).ItemIndex;
  ListBox12.ItemIndex:=(Sender as TListBox).ItemIndex;

   Edit1.Text:=ListBox2.Items[(Sender as TListBox).ItemIndex];
   Edit2.Text:=ListBox3.Items[(Sender as TListBox).ItemIndex];
   Edit4.Text:=ListBox4.Items[(Sender as TListBox).ItemIndex];
   Edit5.Text:=ListBox5.Items[(Sender as TListBox).ItemIndex];
   Edit6.Text:=ListBox6.Items[(Sender as TListBox).ItemIndex];
   ComboBox5.Itemindex:=elmatii_input(ListBox7.Items[(Sender as TListBox).ItemIndex]);
  // Edit7.Text:=ListBox7.Items[(Sender as TListBox).ItemIndex];
   Edit8.Text:=ListBox8.Items[(Sender as TListBox).ItemIndex];
   Edit9.Text:=ListBox9.Items[(Sender as TListBox).ItemIndex];
   Edit10.Text:=ListBox11.Items[(Sender as TListBox).ItemIndex];
   ComboBox3.ItemIndex:=vdi_nr_to_ii(ListBox12.Items[(Sender as TListBox).ItemIndex]);
   is_ok:=false;
  case Edit9.Text of
       'X+': is_ok:=True;
       'X-': is_ok:=True;
       'Y+': is_ok:=True;
       'Y-': is_ok:=True;
       '+X': is_ok:=True;
       '-X': is_ok:=True;
       '+Y': is_ok:=True;
       '-Y': is_ok:=True;
  end;
  Edit10.Enabled:=is_ok;
   //
  end;
end;

procedure TForm1.loadpos(Sender: TObject; var Key: char);
begin

end;

procedure TForm1.loadpos(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

end;

procedure TForm1.loadpos(Sender: TObject; User: boolean);
begin

end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  if OpenDialog2.Execute then begin
     load_edf(OpenDialog2.FileName);
     logToFile('Loaded EDF manually','OK');
  end;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  SaveDialog1.FileName:=Edit3.Text;
  if SaveDialog1.Execute then begin
  CheckBox5.Checked:=True; //mark this file is already 'saved as'
  Form1.Caption:='DXF to AGIE HP ['+SaveDialog1.FileName+']';
  MenuItem13Click(Form1);
  end;
end;

procedure TForm1.MenuItem12Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.MenuItem13Click(Sender: TObject);
var pvdm:TextFile;
  i:integer;
  chc:string;
begin
  if CheckBox5.Checked then begin
      AssignFile(pvdm,SaveDialog1.FileName);
     Rewrite(pvdm);
     writeln(pvdm,'DXF2AGIEHPv'+sw_ver);
     //form1
     if CheckBox1.Checked then writeln(pvdm,'zme:1') //overwrite electrode material
     else writeln(pvdm,'zme:0');
     if CheckBox4.Checked then writeln(pvdm,'zjp:1') //overwrite surface quality
     else writeln(pvdm,'zjp:0');
     writeln(pvdm,'matel:'+inttostr(ComboBox1.ItemIndex));
     writeln(pvdm,'vdisel:'+inttostr(ComboBox2.ItemIndex));
     writeln(pvdm,'matdet:'+inttostr(ComboBox4.ItemIndex));
     writeln(pvdm,'prname:'+Edit3.Text);
     if CheckBox3.Checked then writeln(pvdm,'crgr:1') //create group, for AgieVision only
     else writeln(pvdm,'crgr:0');
     writeln(pvdm,'odlx:'+Edit11.Text);
     writeln(pvdm,'odly:'+Edit12.Text);
     writeln(pvdm,'odlz:'+Edit13.Text);
     writeln(pvdm,'odlc:'+Edit14.Text);
     writeln(pvdm,'ilekol:'+inttostr(SpinEdit1.Value));
     for i:=0 to ListBox1.Count-1 do writeln(pvdm,'lbpwt:'+ListBox1.Items[i]);
     for i:=0 to ListBox2.Count-1 do writeln(pvdm,'lbname:'+ListBox2.Items[i]);
     for i:=0 to ListBox3.Count-1 do writeln(pvdm,'lbx:'+ListBox3.Items[i]);
     for i:=0 to ListBox4.Count-1 do writeln(pvdm,'lby:'+ListBox4.Items[i]);
     for i:=0 to ListBox5.Count-1 do writeln(pvdm,'lbc:'+ListBox5.Items[i]);
     for i:=0 to ListBox6.Count-1 do writeln(pvdm,'lbz:'+ListBox6.Items[i]);
     for i:=0 to ListBox7.Count-1 do writeln(pvdm,'lbmat:'+ListBox7.Items[i]);
     for i:=0 to ListBox8.Count-1 do writeln(pvdm,'lbfp:'+ListBox8.Items[i]);
     for i:=0 to ListBox9.Count-1 do writeln(pvdm,'lbdirb:'+ListBox9.Items[i]);
     for i:=0 to ListBox11.Count-1 do writeln(pvdm,'lbodsb:'+ListBox11.Items[i]);
     for i:=0 to ListBox12.Count-1 do writeln(pvdm,'lbvdi:'+ListBox12.Items[i]);
     writeln(pvdm,'date:'+Edit15.Text); //creation date - not sent to machines
     writeln(pvdm,'ai:'+Edit16.Text); //revision of source drawing - not sent to machines
     //added in v17
     writeln(pvdm,'magpos_x400:'+LabeledEdit1.Text); //Magazine positions of pieces for X400
     //added in v18
     if CheckBox7.Checked then writeln(pvdm,'generated:1') //csv generated by dxf2agie
     else writeln(pvdm,'generated:0');                     //generated by SEB
     if CheckBox8.Checked then writeln(pvdm,'dodsk:1')    //add scanner when creating program for X400
     else writeln(pvdm,'dodsk:0');
     //form2
     writeln(pvdm,'eld:'+Form2.Label13.Caption);
     for i:=0 to Form2.ListBox1.Count-1 do writeln(pvdm,'lbf21:'+Form2.ListBox1.Items[i]);
     for i:=0 to Form2.ListBox2.Count-1 do writeln(pvdm,'lbf22:'+Form2.ListBox2.Items[i]);
     for i:=0 to Form2.CheckListBox1.Count-1 do begin
        if Form2.CheckListBox1.Checked[i] then chc:='1'
        else chc:='0';
        writeln(pvdm,'clbf2:'+Form2.CheckListBox1.Items[i]+':'+chc);
     end;
     logToFile('Saved EDF '+SaveDialog1.FileName,'OK');
     CloseFile(pvdm);
     setChanged(false);
  end
  else MenuItem11Click(Form1);
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
   if OpenDialog4.Execute then load_csv(OpenDialog4.FileName);
end;

function interline:string;
 begin
     Result:='├───────────┼───────────┼───────────┼───────────┼───────────┼──────┼──────────┤';
 end;

procedure TForm1.MenuItem15Click(Sender: TObject);
var i,j,add_sp:integer;
fil:TextFile;
begin
    AssignFile(fil,Application.Location+'\tabela.txt');
    Rewrite(fil);
    writeln(fil,'Tabela drążenia '+Edit3.Text+'/'+Edit16.Text+' ('+FormatDateTime('yyyy-mm-dd HH:nn:ss',Now)+')');
    writeln(fil,'┌───────────┬───────────┬───────────┬───────────┬───────────┬──────┬──────────┐');
    writeln(fil,'│ Elektroda │     X     │     Y     │     C     │     Z     │  dir │    Fp    │');
    //writeln(fil,interline());
    for i:=0 to ListBox2.Count-1 do begin
         writeln(fil,interline());
         write(fil,'│');
         write(fil,ListBox2.Items[i]);
         for j:=length(ListBox2.Items[i]) to 10 do write(fil,' ');
         write(fil,'│');
         if abs(strtofloat(ListBox3.Items[i]))<1 then add_sp:=2
         else add_sp:=2-floor(log10(abs(strtofloat(ListBox3.Items[i]))));
         if ListBox3.Items[i]='-0.0000' then add_sp:=add_sp-1;
         if strtofloat(ListBox3.Items[i])>=0 then write(fil,' ');
         for j:=0 to add_sp do write(fil,' ');
         write(fil,ListBox3.Items[i]);
         for j:=length(ListBox3.Items[i]) to (8-add_sp) do write(fil,' ');
         if strtofloat(ListBox3.Items[i])<0 then write(fil,' ');
         write(fil,'│');
         if abs(strtofloat(ListBox4.Items[i]))<1 then add_sp:=2
         else add_sp:=2-floor(log10(abs(strtofloat(ListBox4.Items[i]))));
         if ListBox4.Items[i]='-0.0000' then add_sp:=add_sp-1;
         if strtofloat(ListBox4.Items[i])>=0 then write(fil,' ');
         for j:=0 to add_sp do write(fil,' ');
         write(fil,ListBox4.Items[i]);
         for j:=length(ListBox4.Items[i]) to (8-add_sp) do write(fil,' ');
         if strtofloat(ListBox4.Items[i])<0 then write(fil,' ');
         write(fil,'│');
         if abs(strtofloat(ListBox5.Items[i]))<1 then add_sp:=2
         else add_sp:=2-floor(log10(abs(strtofloat(ListBox5.Items[i]))));
         if strtofloat(ListBox5.Items[i])>=0 then write(fil,' ');
         for j:=0 to add_sp do write(fil,' ');
         write(fil,ListBox5.Items[i]);
         for j:=length(ListBox5.Items[i]) to (8-add_sp) do write(fil,' ');
         if strtofloat(ListBox5.Items[i])<0 then write(fil,' ');
         write(fil,'│');
         if abs(strtofloat(ListBox6.Items[i]))<1 then add_sp:=2
         else add_sp:=2-floor(log10(abs(strtofloat(ListBox6.Items[i]))));
         for j:=0 to add_sp do write(fil,' ');
         write(fil,ListBox6.Items[i]);
         for j:=length(ListBox6.Items[i]) to (9-add_sp) do write(fil,' ');
         write(fil,'│ '+ListBox9.Items[i]);
         for j:=length(ListBox9.Items[i]) to 4 do write(fil,' ');
         write(fil,'│ ');
         //add_sp:=2-(1+floor(log10(strtofloat(ListBox8.Items[i]))));
         //showmessage(inttostr(add_sp));
         //for j:=1 to add_sp do write(fil,' ');
         write(fil,ListBox8.Items[i]);
         for j:=length(ListBox8.Items[i]) to 8 do write(fil,' ');
         writeln(fil,'│');
    end;
    writeln(fil,'└───────────┴───────────┴───────────┴───────────┴───────────┴──────┴──────────┘');
    CloseFile(fil);
    SysUtils.ExecuteProcess('notepad.exe','"'+Application.Location+'\tabela.txt"');
end;


procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  logToFile('opened settings','OK');
   // open new form with settings
   Form3.ShowModal;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
var dt:TDateTime;
  str:string;
begin
  logToFile('About Form shown','OK');
  dt:=StrToDateTime(StringReplace({$I %DATE%},'/','-',[rfReplaceAll]) + ' ' + {$I %TIME%}); //save compile time and date
  DateTimeToString(str,'yyyy-mm-dd',dt);
  Form4.Label1.Caption:='wersja '+sw_ver+'.'+sw_ver_minor+' ('+str+')';
  Form4.ShowModal; //about
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  logToFile('Help Form shown','OK');
   //modal form - user manual

  Form5.ShowModal;
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
  //do if condition asking for save
  if CheckBox6.Checked then begin
     if CheckBox5.Checked then Form8.Label1.Caption:='Uwaga! niezapisane zmiany w pliku '+SaveDialog1.FileName+' zostaną utracone!'
     else Form8.Label1.Caption:='Uwaga! plik nie zapisany.';
     if Form8.ShowModal=mrOK then MenuItem13Click(Form1);
  end;
  Form1.ListBox1.Clear;
     Form1.ListBox2.Clear;
     Form1.ListBox3.Clear;
     Form1.ListBox4.Clear;
     Form1.ListBox5.Clear;
     Form1.ListBox6.Clear;
     Form1.ListBox7.Clear;
     Form1.ListBox8.Clear;
     Form1.ListBox9.Clear;
     Form1.ListBox11.Clear;
     Form1.ListBox12.Clear;
     Form2.ListBox1.Clear;
     Form2.ListBox2.Clear;
     Form2.CheckListBox1.Clear;
     Form1.Edit3.Text:='';
     setChanged(false);

end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  logToFile('clicked open file button manually','INF');
  OpenDialog1.Execute;
  end_table_line:=0;
  CheckBox2.Checked:=False;
  Button1.Click;
end;

procedure TForm1.nospaces(Sender: TObject; var Key: Word; Shift: TShiftState);
var ust:TIniFile;
  path:string;
begin
  if (AnsiContainsStr((Sender as TEdit).Text,'-') or AnsiContainsStr((Sender as TEdit).Text,' ')) then begin
     (Sender as TEdit).Text:=StringReplace((Sender as TEdit).Text,' ','_',[rfReplaceAll]);
     (Sender as TEdit).Text:=StringReplace((Sender as TEdit).Text,'-','_',[rfReplaceAll]);
     (Sender as TEdit).SelStart:=high(Integer);
   end;
   if length((Sender as TEdit).Text)>1 then begin
   ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   path:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
   Label17.Visible:=directoryExists(path+'\'+Edit3.Text);
   ust.Free;
   setChanged(True);
   end;
end;

procedure TForm1.resizemainf(Sender: TObject);
begin
     if not sizeset then begin
        Form1.Width:=1002;
        Form1.Height:=365;
        sizeset:=true;
     end;
    if Form1.Width<1002 then Form1.Width:=1002;
    if Form1.Height<365 then Form1.Height:=365;
    Form1.ListBox2.Height:=Form1.Height-141;
    Form1.ListBox3.Height:=Form1.Height-141;
    Form1.ListBox4.Height:=Form1.Height-141;
    Form1.ListBox5.Height:=Form1.Height-141;
    Form1.ListBox6.Height:=Form1.Height-141;
    Form1.ListBox7.Height:=Form1.Height-141;
    Form1.ListBox8.Height:=Form1.Height-141;
    Form1.ListBox9.Height:=Form1.Height-141;
    Form1.ListBox11.Height:=Form1.Height-141;
    Form1.ListBox12.Height:=Form1.Height-141;
    Form1.Button4.Top:=Form1.Height-84;
    Form1.Label14.Top:=Form1.Height-76;
    Form1.Label15.Top:=Form1.Height-76;
end;

procedure TForm1.sds(Sender: TObject);
begin

end;

procedure TForm1.setchmathod(Sender: TObject);
begin
  setChanged(true);
end;

initialization
{$I myres.lrs}


end.

