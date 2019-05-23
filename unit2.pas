unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, PrintersDlgs, Forms, Controls, Graphics, Dialogs,
  StdCtrls, CheckLst, ExtCtrls, Menus, inifiles, strutils, Unit10;

type
   TArrayOfString = array of String;
  TAAS = array of TArrayOfSTring;
  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    CheckBox1: TCheckBox;
    CheckListBox1: TCheckListBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboEL1: TComboBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    OpenDialog1: TOpenDialog;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioGroup1: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure chck_l(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure checkmultiel(Sender: TObject);
    procedure comatodot(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbok(Sender: TObject);
    procedure editel(Sender: TObject);
    procedure formclose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure magpos(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

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
   else result:=4;
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



function elmattype(inp:integer):string;
begin
    case inp of
    0: result:='Graphite1';
    1: result:='Graphite2';
    2: result:='Copper';
    else result:='Error';
    end;
end;

function eroding_direction(inp:integer):string;
begin
     case inp of
     0: result:='X-';
     1: result:='X+';
     2: result:='Y-';
     3: result:='Y+';
     4: result:='Z';
     end;
end;

{ TForm2 }

procedure TForm2.editel(Sender: TObject);
var el_values:TArrayOfString;
  dlet,dsig,lang:string;
  ust:TIniFile;
begin
  el_values:=SplitString(';',ListBox1.Items[ChecklistBox1.ItemIndex]); //read hidden listbox of electrode values
  Label1.Caption:=el_values[0]; //electrode name
  case el_values[1] of //populate combo box
       'Grafit1': ComboEL1.ItemIndex:=0;
       'Graphite1': ComboEL1.ItemIndex:=0;
       'Graphite2': ComboEL1.ItemIndex:=1;
       'Copper': ComboEL1.ItemIndex:=2;
       'Kupfer': ComboEL1.ItemIndex:=2;
       else ComboEL1.ItemIndex:=1;  // <- TODO: read settings for default!
  end;
  if ((strtofloat(el_values[2])>0.1) or (strtofloat(el_values[2])=0)) then Edit1.Text:=el_values[2] // fp
  else Edit1.Text:='0.11';
  Edit2.Text:=el_values[3]; // u1
  Edit3.Text:=el_values[4]; // u2
  Edit4.Text:=el_values[5]; // u3
  Edit5.Text:=el_values[6]; // u4
  Edit12.Text:=el_values[7]; //u5
  Edit14.Text:=el_values[8]; //u6
  Edit6.Text:=el_values[9]; // poz1   old 7
  Edit7.Text:=el_values[10]; // poz2  old 8
  Edit8.Text:=el_values[11]; // poz3   old 9
  Edit9.Text:=el_values[12]; // poz4  old 10
  Edit13.Text:=el_values[13]; // poz5
  Edit15.Text:=el_values[14]; // poz6
  Edit10.Text:=el_values[15]; // name for changing in AGIE program //old 11
  Edit11.Text:=el_values[18]; // offset for side eroding  //old 14
  Edit16.Text:=el_values[22]; // Z1
  Edit17.Text:=el_values[23]; // Z2
  Edit18.Text:=el_values[24]; // Z3
  Edit19.Text:=el_values[25]; // Z4
  Edit20.Text:=el_values[26]; // Z5
  Edit21.Text:=el_values[27]; // Z6

  Label8.Caption:=inttostr(CheckListBox1.ItemIndex); //number of electrode on the listbox
  if el_values[16]='1' then CheckBox1.Checked:=True //multi //old 12
  else CheckBox1.Checked:=False;
 // ShowMessage(inttostr(length(el_values[13]))+' '+el_values[13]);
  dlet:='Z';
  dsig:='';
  if length(el_values[17])=2 then begin  //old 13
    case el_values[17][1] of
      '-': dsig:='-';
      '+': dsig:='+';
      'X': dlet:='X';
      'Y': dlet:='Y';
    end;
    case el_values[17][2] of
      '-': dsig:='-';
      '+': dsig:='+';
      'X': dlet:='X';
      'Y': dlet:='Y';
    end;
    end;
    case trim(dlet+dsig) of
      'X-': ComboBox1.ItemIndex:=0;
      'X+': ComboBox1.ItemIndex:=1;
      'Y-': ComboBox1.ItemIndex:=2;
      'Y+': ComboBox1.ItemIndex:=3;
      'Z': ComboBox1.ItemIndex:=4;
    end;
    if trim(dlet+dsig)<>'Z' then Edit11.Enabled:=True
    else Edit11.Enabled:=False;
    ComboBox2.ItemIndex:=strtoint(el_values[19]); //old 15
    ComboBox3.ItemIndex:=vdi_nr_to_ii(el_values[20]); // old 16
    if length(el_values[17])=2 then RadioButton2.Checked:=True
    else RadioButton1.Checked:=True;
     ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    //change strings to language selected in settings
    lang:=ust.ReadString('settings','lang','PL');
    ust.Free;
  if (CheckListBox1.ItemIndex=(CheckListBox1.Count-1)) then Button1.Caption:=DataModule1.getString(lang,55) //change button to more acurately reflect action taken on pressing it
  else Button1.Caption:=DataModule1.getString(lang,54);

end;

procedure TForm2.formclose(Sender: TObject; var CloseAction: TCloseAction);
begin
 // CloseAction:=caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
var ust:TIniFile;
  lang:string;
begin
   ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   OpenDialog1.InitialDir:=ust.ReadString('settings','pathMES','C:\korekty\AGIEVISION_2');
   if ust.ReadString('settings','tabOrderF2','nowy')='nowy' then begin
        Form2.Edit6.TabOrder:=3;
        Form2.Edit3.TabOrder:=4;
        Form2.Edit7.TabOrder:=5;
        Form2.Edit4.TabOrder:=6;
        Form2.Edit8.TabOrder:=7;
        Form2.Edit5.TabOrder:=8;
        Form2.Edit9.TabOrder:=9;
        Form2.Edit12.TabOrder:=10;
        Form2.Edit13.TabOrder:=11;
        Form2.Edit14.TabOrder:=12;
    end
    else begin //stary
        Form2.Edit3.TabOrder:=3;
        Form2.Edit4.TabOrder:=4;
        Form2.Edit5.TabOrder:=5;
        Form2.Edit12.TabOrder:=6;
        Form2.Edit14.TabOrder:=7;
        Form2.Edit6.TabOrder:=8;
        Form2.Edit7.TabOrder:=9;
        Form2.Edit8.TabOrder:=10;
        Form2.Edit13.TabOrder:=11;
        Form2.Edit15.TabOrder:=12;
    end;
    lang:=ust.ReadString('settings','lang','PL');
    Label1.Caption:=DataModule1.getString(lang,49); //elektroda
    Button3.Caption:=DataModule1.getString(lang,50); //odwr zazn
    Label9.Caption:=DataModule1.getString(lang,51); //podwymiar
    Button6.Caption:=DataModule1.getString(lang,52); //z ręcznie
    Button2.Caption:=DataModule1.getString(lang,53); //anuluj
    Button1.Caption:=DataModule1.getString(lang,54); //kolejna elektroda
    RadioGroup1.Caption:=DataModule1.getString(lang,56); //typ podwymiaru
    RadioButton1.Caption:=DataModule1.getString(lang,57); //boczny
    RadioButton2.Caption:=DataModule1.getString(lang,58); //jednakowo odlegly
    Form2.Caption:=DataModule1.getString(lang,59); //lista elektrod
   ust.Free;
end;

procedure TForm2.magpos(Sender: TObject; var Key: Word; Shift: TShiftState);
var ust:TIniFile;
begin
     if (length((Sender as TEdit).Text)>0) then begin
        ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
        if (strtoint((Sender as TEdit).Text) > strtoint(ust.ReadString('settings','maxPositionInMagazine','50'))) then begin
           (Sender as TEdit).Text:=ust.ReadString('settings','maxPositionInMagazine','50');
           (Sender as TEdit).SelStart:=high(Integer);
        end;
        // if (strtoint((Sender as TEdit).Text) < strtoint(ust.ReadString('settings','minPositionInMagazine','1'))) then begin
        //   (Sender as TEdit).Text:=ust.ReadString('settings','minPositionInMagazine','1');
        //   (Sender as TEdit).SelStart:=high(Integer);
        //end;
     ust.Free;
     end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var str,elmname,multi_tf,utype:string;
iii:integer;
ust:TIniFile;
line_changed,ok_for_multi,notcheckingundersize:boolean;
begin
  if length(Edit3.Text)=0 then Edit3.Text:='0';
  if length(Edit4.Text)=0 then Edit3.Text:='0';
  if length(Edit5.Text)=0 then Edit3.Text:='0';
  if length(Edit12.Text)=0 then Edit3.Text:='0';
  if length(Edit14.Text)=0 then Edit3.Text:='0';
  if length(Edit7.Text)=0 then Edit3.Text:='0';
  if length(Edit8.Text)=0 then Edit3.Text:='0';
  if length(Edit9.Text)=0 then Edit3.Text:='0';
  if length(Edit13.Text)=0 then Edit3.Text:='0';
  if length(Edit15.Text)=0 then Edit3.Text:='0';
  randomize;
  str:='0123456789ABCDEFGHIJKLMNOPQRSTUVYZ';
  elmname:='FUT';
  for iii:=1 to 5 do elmname:=elmname + str[random(length(str))+1];
  if CheckBox1.Checked=True then multi_tf:='1'
  else multi_tf:='0';
  if RadioButton1.Checked then utype:='Z'
  else if RadioButton2.Checked then utype:='X+';
  ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
  if ust.ReadString('settings','allowZeroUndersize','0')='1' then notcheckingundersize:=true
  else notcheckingundersize:=false;
  ListBox1.Items.Delete(strtoint(Label8.Caption));  //temp delete existing entry, then add a new one (next line)
  //                          0               1                               2             3                 4             5             6              7             8                9               10              11           12             13              14                15           16           17         18                     19                                 20                           21            22              23              24               25             26              27
  ListBox1.Items.Add(Label1.Caption+';'+elmattype(ComboEL1.ItemIndex)+';'+Edit1.Text+';'+Edit2.Text+';'+Edit3.Text+';'+Edit4.Text+';'+Edit5.Text+';'+Edit12.Text+';'+Edit14.Text+';'+Edit6.Text+';'+Edit7.Text+';'+Edit8.Text+';'+Edit9.Text+';'+Edit13.Text+';'+Edit15.Text+';'+Edit10.Text+';'+multi_tf+';'+utype+';'+Edit11.Text+';'+inttostr(ComboBox2.ItemIndex)+';'+vdi_ii_to_nr(ComboBox3.ItemIndex)+';'+elmname+';'+Edit16.Text+';'+Edit17.Text+';'+Edit18.Text+';'+Edit19.Text+';'+Edit20.Text+';'+Edit21.Text);
  ListBox1.Items.Move((ListBox1.Count-1),strtoint(Label8.Caption)); //move added antry to previous place
  if (((strtofloat(Edit1.Text)>0)and ((strtofloat(Edit2.Text)>0) or notcheckingundersize)) or (CheckListBox1.Checked[CheckListBox1.ItemIndex]=False)) then begin  //check if fp and u1 are empty
    //and ((strtofloat(Edit2.Text)>0) or notcheckingundersize)
     ok_for_multi:=true;
     if Edit2.Text<>Edit3.Text then ok_for_multi:=false;
     if Edit4.Text<>Edit5.Text then ok_for_multi:=false;
     if Edit6.Text<>Edit7.Text then ok_for_multi:=false;
     if Edit8.Text<>Edit9.Text then ok_for_multi:=false;
     if Edit12.Text<>Edit14.Text then ok_for_multi:=false;
     if Edit13.Text<>Edit15.Text then ok_for_multi:=false; // U5 and U6
     ok_for_multi:=true; //disable checks above
     if (CheckBox1.Checked and ok_for_multi) or (not CheckBox1.Checked) then begin
     if CheckListBox1.ItemIndex=(CheckListBox1.Count-1) then begin //when all electrodes done
        Label13.Caption:='done';
        Button5.Click;
        //Form2.Close; //close this window
     end
     else begin
          CheckListBox1.ItemIndex:=(CheckListBox1.ItemIndex+1);  //select next electrode
          Form2.editel(Form2);
          Edit1.SetFocus; //set focus to Fp field
          end;
     end
     else ShowMessage('Błędne dane Multi elektrody');
  end
  else ShowMessage('Wpisz dane w pola: U1 i Fp');
  ust.Free;

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    Form2.Close;
end;

procedure TForm2.Button3Click(Sender: TObject);
var i:integer;
begin
  if ChecklistBox1.Count>0 then begin
    for i:=0 to CheckListBox1.Count-1 do begin
      if CheckListBox1.Checked[i] then CheckListBox1.Checked[i]:=False
      else CheckListBox1.Checked[i]:=True;
    end;
  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  if Form2.Height=633 then begin
      Form2.Height:=460;
      Button4.Caption:='v';
  end
  else if Form2.Height=460 then begin
   Form2.Height:=633;
    Button4.Caption:='^';
  end
  Else Form2.Height:=460;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
  if Edit16.Enabled then begin
     Edit16.Enabled:=False;
     Edit17.Enabled:=False;
     Edit18.Enabled:=False;
     Edit19.Enabled:=False;
     Edit20.Enabled:=False;
     Edit21.Enabled:=False;
  end
  else begin
    Edit16.Enabled:=True;
    Edit17.Enabled:=True;
    Edit18.Enabled:=True;
    Edit19.Enabled:=True;
    Edit20.Enabled:=True;
    Edit21.Enabled:=True;
  end;

end;

procedure TForm2.chck_l(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if length(Edit10.Text)>19 then begin
    Edit10.Text:=LeftStr(Edit10.Text,19);  //max length of electrode name in agievision
    Edit10.SelStart:=high(Integer);
  end;
end;

procedure TForm2.checkmultiel(Sender: TObject);
begin
 if CheckBox1.Checked then begin
    if Edit2.Text<>Edit3.Text then begin //u1 and u2
      Edit2.Color:=clRed;
      Edit3.Color:=clRed;
    end
    else begin
      Edit2.Color:=clDefault;
      Edit3.Color:=clDefault;
    end;
    if Edit4.Text<>Edit5.Text then begin //u3 and u4
      Edit4.Color:=clRed;
      Edit5.Color:=clRed;
    end
    else begin
      Edit4.Color:=clDefault;
      Edit5.Color:=clDefault;
    end;
  end;
end;

procedure TForm2.comatodot(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
     if AnsiContainsStr((Sender as TEdit).Text,',') then begin
        (Sender as TEdit).Text:=StringReplace((Sender as TEdit).Text,',','.',[rfReplaceAll]);
        (Sender as TEdit).SelStart:=high(Integer);
     end;
end;

procedure TForm2.dbok(Sender: TObject);
begin
  if ComboBox1.ItemIndex<>4 then Edit11.Enabled:=True
  else Edit11.Enabled:=False;
end;

end.

