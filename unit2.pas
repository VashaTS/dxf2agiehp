unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  CheckLst, inifiles, strutils;

type
   TArrayOfString = array of String;
  TAAS = array of TArrayOfSTring;
  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckListBox1: TCheckListBox;
    ComboBox1: TComboBox;
    ComboEL1: TComboBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit2: TEdit;
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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure chck_l(Sender: TObject; var Key: Word; Shift: TShiftState);
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

function matforagie(inp:string):string;
begin
 case inp of
     'Graphite1': result:='0001';
     'Graphite2': result:='0002';
     'Copper': result:='0004';
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
  dlet,dsig:string;
begin
  el_values:=SplitString(';',ListBox1.Items[ChecklistBox1.ItemIndex]); //read hidden listbox of electrode values
  Label1.Caption:=el_values[0]; //electrode name
  case el_values[1] of //populate combo box
  'Graphite1': ComboEL1.ItemIndex:=0;
  'Graphite2': ComboEL1.ItemIndex:=1;
  'Copper': ComboEL1.ItemIndex:=2;
  end;
  Edit1.Text:=el_values[2]; // fp
  Edit2.Text:=el_values[3]; // u1
  Edit3.Text:=el_values[4]; // u2
  Edit4.Text:=el_values[5]; // u3
  Edit5.Text:=el_values[6]; // u4
  Edit6.Text:=el_values[7]; // poz1
  Edit7.Text:=el_values[8]; // poz2
  Edit8.Text:=el_values[9]; // poz3
  Edit9.Text:=el_values[10]; // poz4
  Edit10.Text:=el_values[11]; // name for changing in AGIE program
  Edit11.Text:=el_values[14]; // offset for side eroding
  Label8.Caption:=inttostr(CheckListBox1.ItemIndex); //number of electrode on the listbox
  if el_values[12]='1' then CheckBox1.Checked:=True //multi
  else CheckBox1.Checked:=False;
 // ShowMessage(inttostr(length(el_values[13]))+' '+el_values[13]);
  dlet:='Z';
  dsig:='';
  if length(el_values[13])=2 then begin
    case el_values[13][1] of
      '-': dsig:='-';
      '+': dsig:='+';
      'X': dlet:='X';
      'Y': dlet:='Y';
    end;
    case el_values[13][2] of
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
  if (CheckListBox1.ItemIndex=(CheckListBox1.Count-1)) then Button1.Caption:='Koniec - zapisz program'; //change button to more acurately reflect action taken on pressing it

end;

procedure TForm2.formclose(Sender: TObject; var CloseAction: TCloseAction);
begin
 // CloseAction:=caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
var ust:TIniFile;
begin
   ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   OpenDialog1.InitialDir:=ust.ReadString('settings','pathMES','C:\korekty\AGIEVISION_2');
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
     ust.Free;
     end;
end;

procedure TForm2.Button1Click(Sender: TObject);
var preset,fut,fur,f0r,f00,tempp:Textfile;
pval,eval,pval2,tf_val,pe_val,lb1,prefil:TArrayOfString;
pline,str,elmname,dir,strat,phase,eip,elno,multi_tf,umode,le,f00f,f00_sk:string;
i,j,ii,iii,amount_of_el:integer;
ust:TIniFile;
line_changed:boolean;
begin
  randomize;
  str:='0123456789ABCDEFGHIJKLMNOPQRSTUVYZ';
  elmname:='FUT';
  for iii:=1 to 5 do elmname:=elmname + str[random(length(str))+1];
  if CheckBox1.Checked=True then multi_tf:='1'
  else multi_tf:='0';
  ListBox1.Items.Delete(strtoint(Label8.Caption));  //temp delete existing entry, then add a new one (next line)
  //                          0               1                               2             3                 4             5             6              7             8                9              10              11           12                       13                             14            15
  ListBox1.Items.Add(Label1.Caption+';'+elmattype(ComboEL1.ItemIndex)+';'+Edit1.Text+';'+Edit2.Text+';'+Edit3.Text+';'+Edit4.Text+';'+Edit5.Text+';'+Edit6.Text+';'+Edit7.Text+';'+Edit8.Text+';'+Edit9.Text+';'+Edit10.Text+';'+multi_tf+';'+ComboBox1.Items[ComboBox1.ItemIndex]+';'+Edit11.Text+';'+elmname);
  ListBox1.Items.Move((ListBox1.Count-1),strtoint(Label8.Caption)); //move added antry to previous place
  if (((strtofloat(Edit1.Text)>0) and (strtofloat(Edit2.Text)>0)) or (CheckListBox1.Checked[CheckListBox1.ItemIndex]=False)) then begin  //check if fp and u1 are empty
     if CheckListBox1.ItemIndex=(CheckListBox1.Count-1) then begin //when all electrodes done
        if OpenDialog1.Execute then begin
           AssignFile(preset,OpenDialog1.FileName);
           AssignFile(tempp,'temp.mes');
           reset(preset);
           rewrite(tempp);
           repeat
                readln(preset,pline);
                prefil:=SplitString(',',pline);
                pval2:=SplitString(';',prefil[0]);
                line_changed:=False;
                for i:=0 to ListBox1.Count-1 do begin //add multi electrodes to mes file
                    lb1:=SplitString(';',ListBox1.Items[i]);
                    if ((lb1[11]=pval2[0]) and (lb1[12]='1')) then begin
                        line_changed:=True;
                        if pval2[1]='R1' then begin
                          writeln(tempp,pline);
                          writeln(tempp,pval2[0]+';R2,U,,0,,,,,,,'+floattostr(strtofloat(prefil[10])*(-1))+','+floattostr(strtofloat(prefil[11])*(-1))+','+prefil[12]+',0.000,0.000,'+floattostr(strtofloat(prefil[15])+180)+',0,0,0,,0.000,,,,,,');
                        end;
                        if pval2[1]='R2' then begin
                          writeln(tempp,pval2[0]+';R3,U,,0,,,,,,,'+prefil[10]+','+prefil[11]+','+prefil[12]+',0.000,0.000,'+prefil[15]+',0,0,0,,0.000,,,,,,');
                          writeln(tempp,pval2[0]+';R4,U,,0,,,,,,,'+floattostr(strtofloat(prefil[10])*(-1))+','+floattostr(strtofloat(prefil[11])*(-1))+','+prefil[12]+',0.000,0.000,'+floattostr(strtofloat(prefil[15])+180)+',0,0,0,,0.000,,,,,,');
                        end;
                    end;
                end;
                if line_changed=False then writeln(tempp,pline);
           until eof(preset);
           CloseFile(preset);
           CloseFile(tempp);
           AssignFile(preset,'temp.mes');
           reset(preset);
           repeat
              readln(preset,pline);
              pval:=SplitString(',',pline);
              for ii:=0 to (ListBox1.Count-1) do begin
                  eval:=SplitString(';',ListBox1.Items[ii]);
                  pval2:=SplitString(';',pval[0]);
                  if eval[11]=pval2[0] then begin
                     if pval2[1]='R1' then begin //0       1            2            3            4          5          6              7            8            9         10
                                           //  name       Rx           mat          fp           u1          x          y              z            c           poz        dxf name
                         ListBox2.Items.Add(eval[11]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[3]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[7]+';'+eval[0]);
                     end
                     else if ((pval2[1]='R2') and (eval[4]<>'0')) then ListBox2.Items.Add(eval[11]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[4]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[8]+';'+eval[0])
                     else if ((pval2[1]='R3') and (eval[5]<>'0')) then ListBox2.Items.Add(eval[11]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[5]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[9]+';'+eval[0])
                     else if ((pval2[1]='R4') and (eval[6]<>'0')) then ListBox2.Items.Add(eval[11]+';'+pval2[1]+';'+eval[1]+';'+eval[2]+';'+eval[6]+';'+pval[10]+';'+pval[11]+';'+pval[12]+';'+pval[15]+';'+eval[10]+';'+eval[0]);
                  end;
              end;
           until eof(preset);
           CloseFile(preset);
           //save FUT files
           ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
           dir:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output')+'\'+Label11.Caption;
           strat:=ust.ReadString('settings','electrodeStrategy','1');
           ust.Free;
           forcedirectories(dir); //create folders if needed
           if ListBox1.Count>0 then begin //if any electrodes exist in listbox1
               for i:=0 to ListBox1.Count-1 do begin //for every electrode family
                   if CheckListBox1.Checked[i]=True then begin
                   tf_val:=SplitString(';',ListBox1.Items[i]);
                   amount_of_el:=0;
                   for j:=0 to ListBox2.Count-1 do begin
                       pe_val:=SplitString(';',ListBox2.Items[j]);
                       if tf_val[11]=pe_val[0] then inc(amount_of_el);
                   end;
                   if tf_val[13]<>'Z' then begin
                      f00f:='6';
                   end
                   else begin
                        f00f:='2';
                   end;

                   AssignFile(fut,dir+'\'+tf_val[15]+'.FUT');
                   rewrite(fut);                             //   name                            fp
                   write(fut,'TRON,05.01.0'+AnsiString(#10)+'F,'+tf_val[11]+',2,0,1,2,0.,0.,0.,'+tf_val[2]+',0.,0.,0.,0,'+inttostr(amount_of_el)+',0,1,0,0001,0,'+f00f+',2,1,1,0,0,1;0;2;0;2;0;4;3;1;$;2;'+matforagie(tf_val[1])+';T;1;'+AnsiString(#10));
                   AssignFile(f00,dir+'\'+tf_val[15]+'.F00');
                   rewrite(f00);
                   write(f00,'_TRON_,AGIEFUT_05.01.0'+AnsiSTring(#10)+'F,1,16678904,'+tf_val[11]+',2,0,1,2,0.,0.,0.,'+tf_val[2]+',0.,0.,0.,0,'+inttostr(amount_of_el)+',0,0,1,0,'+f00f+',2,1,1,0,0'+AnsiString(#10));
                   if ListBox2.Count>0 then begin // add physical electrodes
                       for j:=0 to ListBox2.Count-1 do begin //for every entry in physical electrode list
                          pe_val:=SplitString(';',ListBox2.Items[j]);
                          if tf_val[11]=pe_val[0] then begin
                              if pe_val[1]='R1' then begin
                                 phase:='1';
                                 eip:='1';
                                 elno:='1';
                              end
                              else if pe_val[1]='R2' then begin
                                  if ((strat<>'1') and (tf_val[6]<>'0')) then begin //second roughing el
                                     phase:='1';
                                     eip:='2';
                                     elno:='2';
                                  end
                                  else begin
                                     phase:='2';
                                     eip:='1';
                                     elno:='2';
                                  end;
                              end
                              else if pe_val[1]='R3' then begin
                                   if ((tf_val[6]='0') and (strat='3')) then begin // phase 3
                                      phase:='3';
                                      eip:='1';
                                      elno:='3';
                                   end
                                   else begin //phase 2
                                      if (strat='1') or ((tf_val[6]='0') and (strat='2')) then begin
                                         phase:='2';
                                         eip:='2';
                                         elno:='3';
                                      end
                                      else if ((strat='2') and (tf_val[6]<>'0')) then begin
                                         phase:='2';
                                         eip:='1';
                                         elno:='3';
                                      end;
                                   end;
                              end
                              else if pe_val[1]='R4' then begin
                                   if strat='3' then begin // phase 3
                                      phase:='3';
                                      eip:='1';
                                      elno:='4';
                                   end
                                   else if strat='2' then begin //phase 2
                                      phase:='2';
                                      eip:='2';
                                      elno:='4';
                                   end
                                   else if strat='1' then begin //phase 2
                                      phase:='2';
                                      eip:='3';
                                      elno:='4';
                                   end;
                              end;
                              if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                              else umode:='1';
                              if tf_val[12]='1' then le:='LE'+pe_val[9]
                              else le:='$';
                              if tf_val[13]<>'Z' then begin
                                 f00_sk:=pe_val[4];
                              end
                              else begin
                                   f00_sk:='0.';
                              end;
                              write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+pe_val[4]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                              write(fut,'U,R'+elno+',1,2,'+pe_val[9]+',3,'+pe_val[4]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,'+le+',F,0,0,T,0.,1,'+inttostr(strtoint(tf_val[12])+1)+',V'+elno+','+tf_val[11]+AnsiString(#10));
                              write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+pe_val[4]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                              write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+pe_val[9]+',3,'+pe_val[4]+','+pe_val[5]+','+pe_val[6]+','+pe_val[7]+','+pe_val[8]+',0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,'+le+',F,0,0,T,'+f00_sk+',1,'+inttostr(strtoint(tf_val[12])+1)+',1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                          end;
                       end;
                   end; //listbox2 - physical electrodes
                   CloseFile(fut);
                   CloseFile(f00);
                   AssignFile(fur,dir+'\'+tf_val[15]+'.FUR');
                   rewrite(fur);
                   write(fur,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME '+tf_val[11]+';'+AnsiString(#10)+'AGIE.USING_1 IMPORT COUNT_0 '+tf_val[15]+'.F00;');
                   CloseFile(fur);
                   AssignFile(f0r,dir+'\'+tf_val[15]+'.F0R');
                   rewrite(f0r);
                   write(f0r,'AGIE.VERSION 2,05.01.0;'+AnsiSTring(#10)+'.LONGNAME '+tf_val[11]+';');
                   CloseFile(f0r);
                   Label12.Caption:=Label12.Caption+'.';
                   end; //if checked
               end; //iterating through Listbox1
           end; //if any electrodes exist in listbox1
        end //if .mes file opened
        else begin //do electrodes based on ListBox1, without mes and listbox2
             for i:=0 to ListBox1.Count-1 do begin
                 if CheckListBox1.Checked[i]=True then begin
                 tf_val:=SplitString(';',ListBox1.Items[i]);
                 ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
                 dir:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output')+'\'+Label11.Caption;
                 strat:=ust.ReadString('settings','electrodeStrategy','1');
                 ust.Free;
                 forcedirectories(dir); //create folders if needed
                 AssignFile(fur,dir+'\'+tf_val[15]+'.FUR');
                 rewrite(fur);
                 write(fur,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME '+tf_val[11]+';'+AnsiString(#10)+'AGIE.USING_1 IMPORT COUNT_0 '+tf_val[13]+'.F00;');
                 CloseFile(fur);
                 AssignFile(f0r,dir+'\'+tf_val[15]+'.F0R');
                 rewrite(f0r);
                 write(f0r,'AGIE.VERSION 2,05.01.0;'+AnsiSTring(#10)+'.LONGNAME '+tf_val[11]+';');
                 CloseFile(f0r);
                 if tf_val[6]<>'0' then amount_of_el:=4
                 else if tf_val[5]<>'0' then amount_of_el:=3
                 else if tf_val[4]<>'0' then amount_of_el:=2
                 else amount_of_el:=1;
                 AssignFile(fut,dir+'\'+tf_val[15]+'.FUT');
                 rewrite(fut);                             //   name                            fp
                 write(fut,'TRON,05.01.0'+AnsiString(#10)+'F,'+tf_val[0]+',2,0,1,2,0.,0.,0.,'+tf_val[2]+',0.,0.,0.,0,'+inttostr(amount_of_el)+',0,1,0,0001,0,2,2,1,1,0,0,1;0;2;0;2;0;4;3;1;$;2;'+matforagie(tf_val[1])+';T;1;'+AnsiString(#10));
                 AssignFile(f00,dir+'\'+tf_val[15]+'.F00');
                 rewrite(f00);
                 write(f00,'_TRON_,AGIEFUT_05.01.0'+AnsiSTring(#10)+'F,1,16678904,'+tf_val[11]+',2,0,1,2,0.,0.,0.,'+tf_val[2]+',0.,0.,0.,0,'+inttostr(amount_of_el)+',0,0,1,0,2,2,1,1,0,0'+AnsiString(#10));
                 if strat='1' then begin
                    elno:='1';
                    phase:='1';
                    eip:='1';                                                              //u1
                    if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                    else umode:='1';
                    write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[3]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                     write(fut,'U,R'+elno+',1,2,'+tf_val[7]+',3,'+tf_val[3]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[11]+AnsiString(#10));
                     write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[3]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                     write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[7]+',3,'+tf_val[3]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,T,0,0,T,0.,1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                     if amount_of_el>=2 then begin
                        elno:='2';
                        phase:='2';
                        eip:='1';                                                              //u1
                        if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                        else umode:='1';
                        write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[4]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                        write(fut,'U,R'+elno+',1,2,'+tf_val[8]+',3,'+tf_val[4]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[11]+AnsiString(#10));
                        write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[4]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                        write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[8]+',3,'+tf_val[4]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,T,0,0,T,0.,1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                        if amount_of_el>=3 then begin
                           elno:='3';
                           phase:='2';
                           eip:='2';                                                              //u1
                           if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                           else umode:='1';
                           write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[5]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                           write(fut,'U,R'+elno+',1,2,'+tf_val[9]+',3,'+tf_val[5]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[11]+AnsiString(#10));
                           write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[5]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                           write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[9]+',3,'+tf_val[5]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,T,0,0,T,0.,1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                           if amount_of_el=4 then begin
                              elno:='4';
                              phase:='2';
                              eip:='3';                                                              //u1
                              if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                              else umode:='1';
                              write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[6]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                              write(fut,'U,R'+elno+',1,2,'+tf_val[10]+',3,'+tf_val[6]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[11]+AnsiString(#10));
                              write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[6]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                              write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[10]+',3,'+tf_val[6]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,T,0,0,T,0.,1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                           end;
                        end;
                     end;
                 end //strat 1
                 else if strat='2' then begin
                     elno:='1';
                    phase:='1';
                    eip:='1';                                                              //u1
                    if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                    else umode:='1';
                     write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[3]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                     write(fut,'U,R'+elno+',1,2,'+tf_val[7]+',3,'+tf_val[3]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[11]+AnsiString(#10));
                     write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[3]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                     write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[7]+',3,'+tf_val[3]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,T,0,0,T,0.,1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                     if amount_of_el>=2 then begin
                        if amount_of_el<4 then begin
                             elno:='2';
                             phase:='2';
                             eip:='1';
                        end
                        else begin
                             elno:='2';
                             phase:='1';
                             eip:='2';
                        end;
                        if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                        else umode:='1';
                        write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[4]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                        write(fut,'U,R'+elno+',1,2,'+tf_val[8]+',3,'+tf_val[4]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[11]+AnsiString(#10));
                        write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[4]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                        write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[8]+',3,'+tf_val[4]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,T,0,0,T,0.,1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                        if amount_of_el>=3 then begin
                           if amount_of_el=4 then begin
                              elno:='3';
                             phase:='2';
                             eip:='1';
                           end
                           else begin
                              elno:='3';
                             phase:='2';
                             eip:='2';
                            end;
                           if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                           else umode:='1';
                           write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[5]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                           write(fut,'U,R'+elno+',1,2,'+tf_val[9]+',3,'+tf_val[5]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[11]+AnsiString(#10));
                           write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[5]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                           write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[9]+',3,'+tf_val[5]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,T,0,0,T,0.,1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                           if amount_of_el=4 then begin
                               elno:='4';
                             phase:='2';
                             eip:='2';
                             if ((strtoint(elno)>1) and (strtoint(phase)>=2)) then umode:='2'
                             else umode:='1';
                              write(fut,'O,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[6]+',1,'+umode+',0,1,0,0.,1,'+tf_val[11]+AnsiString(#10));
                              write(fut,'U,R'+elno+',1,2,'+tf_val[10]+',3,'+tf_val[6]+',0.,0.,0.,0.,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,'+phase+','+eip+',1,$,F,0,0,T,0.,1,1,V'+elno+','+tf_val[11]+AnsiString(#10));
                              write(f00,'O,'+inttostr((strtoint(elno)*2))+',7166,V'+elno+','+matforagie(tf_val[1])+','+phase+','+eip+','+tf_val[6]+',1,'+umode+',0,1,0,'+inttostr((strtoint(elno)*2))+',0.,1,1'+AnsiSTring(#10));                 //'+inttostr((strtoint(elno)*2)+1)+' ??
                              write(f00,'U,'+inttostr((strtoint(elno)*2)+1)+',4246470654+7,R'+elno+',1,2,'+tf_val[10]+',3,'+tf_val[6]+',0,0,0,0,0.,0.,0.,0.,0.,0.,0,$,$,F,T,V'+elno+',1,1,$,0,1,$,T,0,0,T,0.,1,1,1,'+inttostr((strtoint(elno)*2))+AnsiString(#10));
                             end;
                        end;
                     end;
                 end //strat 2
                 else if strat='3' then begin

                 end; //strat 3
                 CloseFile(fut);
                 CloseFile(f00);
                 end; //if electrode checked
             end;
        end;
        Label13.Caption:='done';
        Form2.Visible:=False; //close this window
     end
     else begin
          CheckListBox1.ItemIndex:=(CheckListBox1.ItemIndex+1);

          Form2.editel(Form2);
          Edit1.SetFocus; //set focus to Fp field
     end;
  end
  else ShowMessage('Wpisz dane w pola: U1 i Fp');

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    Form2.Visible:=False;
end;

procedure TForm2.chck_l(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if length(Edit10.Text)>19 then Edit10.Text:=LeftStr(Edit10.Text,19);  //max length of electrode in agievision
  Edit10.SelStart:=high(Integer);
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

