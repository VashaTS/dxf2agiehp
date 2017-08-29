unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Comctrls, Spin, Menus, strings, Math, Unit2, Unit3, Unit4, Unit5,
  Unit6, DCPsha256, inifiles, StrUtils, DateUtils, ShellAPI, Windows;

type
  TArrayOfString = array of String;
  TAAS = array of TArrayOfSTring;

  { TForm1 }

  TForm1 = class(TForm)
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
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
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
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
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
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    OpenDialog1: TOpenDialog;
    PaintBox1: TPaintBox;
    ProgressBar1: TProgressBar;
    SpinEdit1: TSpinEdit;
    Timer1: TTimer;
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
    procedure Button9Click(Sender: TObject);
    procedure chkeckTypedDir(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure comatodot(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ComboBox3Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure handleparams(Sender: TObject);
    procedure hp2(Sender: TObject; const FileNames: array of String);
    procedure loadpos(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure nospaces(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure scrollothers(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure shlogf(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  end_table_line,offset,tableno,errorlevel,gel:integer;
  plsr12sc:boolean;

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

function isSignedFloat(s:string):boolean;
var i:integer;
begin
     i:=1;
     while (i<=length(s)) and (s[i] in ['0'..'9','.','-']) do inc(i);
     result:=i>length(s);
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

{ TForm1 }

procedure TForm1.scrollothers(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.shlogf(Sender: TObject);
begin
  Form6.ShowModal;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var rnumber,rname,str,dir,strat,gnam,z_in_mach,mach_add,z_in_geo,geo_add,geo_add2,iname,iusing,sp_coords,drbok,mtd,only_ret,only_vector,pozp:string;
  min_z,i,j,k,using_nr,amount_of_el,kapiel,last_using,bea_nr:integer;
  job,jor,tek,ter,iso,isr:TextFile;
  ust:TIniFile;
  p_elval,p_elam,isoval:TArrayOfString;
  //min_z:real;
  phase,eip:Array[1..4] of integer;
  do_this_el,exists_in_list:boolean;
begin
    ProgressBar1.Position:=(length(Form2.Label12.Caption)-1)*10;
   if Form2.Label13.Caption='done' then begin // save JOB
     Timer1.Enabled:=False; // stop checking
     ProgressBar1.max:=40;
     ProgressBar1.Position:=0;
     randomize;
     str:='0123456789ABCDEFGHIJKLMNOPQRSTUVYZ';
     rname:='JOB';
     for i:=1 to 5 do rname:=rname + str[random(length(str))+1];  //random filename for program files
     str:='0123456789';
     rnumber:='1';
     for i:=1 to 3 do rnumber:=rnumber + str[random(length(str))+1];
     ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     dir:=ust.ReadString('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output')+'\'+Edit3.Text;
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
            write(jor,'AGIE.USING_'+inttostr(i+2)+' IMPORT COUNT_1 '+p_elval[17]+'.FUT;'+AnsiString(#10)); //import every electrode for use in .JOB file
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
                  if p_elval[16]=ListBox13.Items[j] then exists_in_list:=True;
              end;
              if exists_in_list=false then ListBox13.Items.Add(p_elval[16]);
          end
          else ListBox13.Items.Add(p_elval[16]);
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

     write(job,'W,'+Edit3.Text+',4,000,0001,AGIE.BEA_1,,1,2,'+pozp+',1,0,F,0,T,2,40,'+floattostr(strtofloat(Edit11.Text)*(-1))+','+floattostr(strtofloat(Edit12.Text)*(-1))+','+floattostr(strtofloat(Edit13.Text)*(-1))+',0.0,0.0,'+Edit14.Text+',0.0,0.0,0.0,0.0,0.0,100,100,50,-50,-50,-50,30,1,0,KW,0,F,0,F,0,F,0,0,F,1.3,T,0.8,F,$,$,1,$,$,$,$,2,TipoEdit2,TipoGraph,65536,0,0,0,65536,0,5000,5000,1,TipoGraph,65536,0,0,0,65536,0,10000,10000,1');
     if CheckBox3.Checked= True then write(job,AnsiString(#10)+'G,'+gnam+','+inttostr(ListBox2.Count)+',+0.0000,+0.0000,0.0,0,0,0.0,0,0,0,0,0,1,1,1,1,0,F,0,T,2,40,AGIE.BEA_1,,0,1,0,0,F,0,F,0,0,F,1.3,0001,0,F,'+Edit3.Text+',$,2,1.0000,1.0000,2,65536,0,0,0,65536,0,10000,10000,1,TipoGraph,65536,0,0,0,65536,0,10000,10000,1');
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
                      if p_elam[6]<>'0' then amount_of_el:=4
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
                          if ListBox13.Items[k]=p_elam[16] then bea_nr:=k+1;
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
                                'X+': sp_coords:='-'+ListBox11.Items[i]+', 0.0, 0';
                                'X-': sp_coords:=ListBox11.Items[i]+', 0.0, 0';
                                'Y+': sp_coords:='0.0, -'+ListBox11.Items[i]+', 0';
                                'Y-': sp_coords:='0.0, '+ListBox11.Items[i]+', 0';
                           end;
                           z_in_mach:=ListBox6.Items[i];
                           mach_add:=' 8, '+inttostr(amount_of_el)+'; 0; '+ListBox11.Items[i]+'; 0; 0; 0';
                           z_in_geo:='0';
                           if iusing='error' then ShowMessage('Wrong using number for iso file!');
                           geo_add:='2,2,1,1,0.0,2,1,1,AGIE.USING_'+iusing;
                           geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,2,0,0,0,0,0,45,0,1,3,0,0,0,0,1,F,F,1,0,1,0,0,0,0,0,0,0,T,1,1,2,3,4,0,0,0,0,0,0,F,2,0,0,-1,2,1,1,0,0,0,0,0,0';
                           only_vector:='T';
                           only_ret:='1';
                      end
                      else begin
                           for j:=0 to Form2.ListBox1.Count-1 do begin
                               p_elam:=SplitString(';',Form2.ListBox1.Items[j]);
                               if p_elam[0]=ListBox2.Items[i] then mtd:=p_elam[15];
                           end;
                           sp_coords:='0.0000,0.0000,3.0000';
                           z_in_mach:='0.0';
                           mach_add:='0,0';
                           z_in_geo:=ListBox6.Items[i];
                           geo_add:='2,1,1,1,0.0,0,1,2,';
                           //get values for this electrode and set varribles to the coresponding EDM method
                           if mtd='1' then only_vector:='F'
                           else only_vector:='T';
                           if mtd='3' then only_ret:='2'
                           else only_ret:='1';
                           if mtd='0' then      geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,5,0,0,0,0,0,45,1,1,3,0,0,0,0,1,F,T,1,0,1,0,0,0,0,0,0,0,F,1,1,2,3,4,0,0,0,0,0,0,F,1,0,0,0,1,1,1,0,0,0,0,0,0'  //3d
                           else if mtd='3' then geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,5,0,0,0,0,0,45,1,2,3,0,0,0,0,1,F,T,1,0,1,0,0,0,0,0,0,0,F,1,1,2,3,4,0,0,0,0,0,0,F,1,0,0,0,1,1,1,0,0,0,0,0,0'  //ret
                           else                 geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,5,0,0,0,0,0,45,1,1,3,0,0,0,0,1,F,T,1,0,1,0,0,0,0,0,0,0,F,1,1,2,3,4,0,0,0,0,0,0,F,1,0,0,0,1,1,1,0,0,0,0,0,0'; //cyl & vect
                      end;
            // end of eroding direction things

            if CheckBox3.Checked=True then write(job,AnsiString(#10)+'R,Mach'+inttostr(i)+','+ListBox3.Items[i]+','+ListBox4.Items[i]+','+z_in_mach+',0,0,'+ListBox5.Items[i]+',0,0,0,0,0,F,F,1,1,0,F,0,T,2,'+inttostr(kapiel)+',AGIE.USING_'+inttostr(using_nr)+',0,Geo_Mach'+inttostr(i)+',1,0001,AGIE.BEA_'+inttostr(bea_nr)+',F,,StartPoint,6,,-1,1,0,0,0,0,T,5,F,T,T,T,F,0,0,0,1,0,'+mach_add+',0,0,0,0,1,0,0,0,134,'+gnam+','+Edit3.Text+',$,1.0000,1.0000,1,65536,0,0,0,65536,0,10000,10000,1'+AnsiString(#10))
            else                           write(job,AnsiString(#10)+'A,Mach'+inttostr(i)+','+ListBox3.Items[i]+','+ListBox4.Items[i]+','+z_in_mach+',0,0,'+ListBox5.Items[i]+',0,0,0,0,0,F,F,1,1,0,F,0,T,2,'+inttostr(kapiel)+',AGIE.USING_'+inttostr(using_nr)+',0,Geo_Mach'+inttostr(i)+',1,0001,AGIE.BEA_'+inttostr(bea_nr)+',F,,StartPoint,5,,-1,1,0,0,0,0,T,5,F,T,T,T,F,0,0,0,1,0,'+mach_add+',0,0,0,0,1,0,0,0,138,'+Edit3.Text+',$,1.0000,1.0000,1,64420,11397,0,-11397,64420,0,11000,11000,1'+AnsiString(#10));
            write(job,'E,Geo_Mach'+inttostr(i)+',T,T,F,1,'+only_vector+','+geo_add+',0,0,'+z_in_geo+',0,0,0,T,0,0.0,0.0,F,'+only_ret+',0,0,0,0,0,0,0,360,0,F,'+geo_add2+',Mach'+inttostr(i)+','+gnam+','+Edit3.Text+',$');
            //next lines for every physical electrode of this family (copy of .FUT information basically, but in slightly different format, cannot be copied)

            for j:=1 to 4 do begin
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
                 else begin //j=4
                    phase[j]:=2;
                    eip[j]:=2;
                 end;
              end;
            end
            else if strat='3' then begin
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
             write(job,AnsiString(#10)+'I,StartPoint,'+sp_coords+',0,3.0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,T,F,F,Mach'+inttostr(i)+','+gnam+','+Edit3.Text+',$');
         end; //do_this_el
     end;

     CloseFile(job);
     if ListBox10.Count>0 then begin //create iso files
        for i:=0 to ListBox10.Count-1 do begin
            isoval:=SplitString(';',ListBox10.Items[i]);
            AssignFile(iso,dir+'\'+isoval[3]+'.ISO');
            rewrite(iso);
            case isoval[1] of
                 'X+': sp_coords:='X -'+isoval[2]+'Y0.0';
                 'X-': sp_coords:='X '+isoval[2]+'Y0.0';
                 'Y+': sp_coords:='X0.0Y -'+isoval[2];
                 'Y-': sp_coords:='X0.0Y '+isoval[2];
            end;
            case isoval[1] of
                 'X+': drbok:='X '+isoval[2];
                 'X-': drbok:='X -'+isoval[2];
                 'Y+': drbok:='Y '+isoval[2];
                 'Y-': drbok:='Y -'+isoval[2];
            end;

            write(iso,'N0G00'+sp_coords+'Z 0.;'+AnsiString(#10)+'N1G91;'+AnsiString(#10)+'N2G01'+drbok+';'+AnsiString(#10)+'N3M02;');
            CloseFile(iso);
            AssignFile(isr,dir+'\'+isoval[3]+'.ISR');
            rewrite(isr); //isr is the metadata file required for every iso
            write(isr,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME Machiso'+isoval[4]+';');
            CloseFile(isr);
        end;
     end;
     ProgressBar1.Position:=40;
     logToFile('saved program '+Edit3.Text,'OK');
     ShowMessage('Program '+Edit3.Text+' zapisany!'); // TODO: custom form with "open folder" button

     Application.Terminate;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var fil:Textfile;
  sl,newsl:TStringList;
  acceptable_list:Array[1..37] of string;
  line,savedline,str,path:string; // single line of a dxf file
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
    Button3.Enabled:=True;
    Form2.CheckListBox1.Clear;
    Form2.ListBox1.Clear;
    if length(OpenDialog1.Filename)>3 then begin  // open file dialog, show error if no file is selected
     maxtables:=0;
     maxline:=0;
     AssignFile(fil,OpenDialog1.FileName); //dxf file choosen by user
    reset(fil);
    repeat //find out number of eroding tables in file
    readln(fil,line);
    if AnsiContainsStr(line,'Electrodes are used for the following parts') then inc(maxtables);
    if AnsiContainsStr(line,'Elektroden werden fuer folgende Teile verwendet') then inc(maxtables);
    if AnsiContainsStr(line,'Elektroden werden für folgende Teile verwendet') then inc(maxtables);
    if AnsiContainsStr(line,'Elektroden werden fur folgende Teile verwendet') then inc(maxtables);
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
    plkp20z:=False;           // special case indicator for certain kind of dxf made by 1 person with bad configuration
    col_count_found:=False;  //it is here to allow tables of different column amount in the same dxf
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
               acceptable_list[37]:='bugfix_nonsense';

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
                        //the actual alternathe method below
                        //if (isNumber(trim(line)) and (length(trim(line))=7)) then ListBox2.Items.Add(trim(line))
                        //else if
                   end;
               end;
               if ListBox1.Count>=SpinEdit1.Value then if assign_columns_done=False then begin //assign columns when all read, if not already done
                  //pre-set varribles to 9999 - means no column present, high value = no common multiplier in low numbers
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
                  assign_columns_done:=True; //mark this done, so it wont happen again
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
    Button2.Enabled:=True; // elektrody...
    Button3.Enabled:=True; // pokaz dane
    Button7.Enabled:=True; // graficheck
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
   Label17.Visible:=directoryExists(path+'\'+Edit3.Text);
   ust.Free;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
  if length(Edit3.Text)>0 then begin
      Button2.Enabled:=True;
      Button3.Enabled:=True;
      Button7.Enabled:=True;
      logToFile('new empty program '+Edit3.Text,'OK');
      Button3.Click;
  end
  else ShowMessage('Wpisz nazwę programu!');
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  logToFile('changed line (id: '+ListBox2.Items[ListBox2.ItemIndex]+' -> '+Edit1.Text+', X: '+ListBox3.Items[ListBox2.ItemIndex]+' -> '+Edit2.Text+', Y: '+ListBox4.Items[ListBox2.ItemIndex]+' -> '+Edit4.Text+', C: '+ListBox5.Items[ListBox2.ItemIndex]+' -> '+Edit5.Text+', Z: '+ListBox6.Items[ListBox2.ItemIndex]+' -> '+Edit6.Text+' )','INF');
   ListBox2.Items[ListBox2.ItemIndex]:=Edit1.Text;
   ListBox3.Items[ListBox2.ItemIndex]:=Edit2.Text;
   ListBox4.Items[ListBox2.ItemIndex]:=Edit4.Text;
   ListBox5.Items[ListBox2.ItemIndex]:=Edit5.Text;
   ListBox6.Items[ListBox2.ItemIndex]:=Edit6.Text;
   ListBox7.Items[ListBox2.ItemIndex]:=Edit7.Text;
   ListBox8.Items[ListBox2.ItemIndex]:=Edit8.Text;
   ListBox9.Items[ListBox2.ItemIndex]:=Edit9.Text;
   ListBox11.Items[ListBox2.ItemIndex]:=Edit10.Text;
   ListBox12.Items[ListBox2.ItemIndex]:=vdi_ii_to_nr(ComboBox3.ItemIndex);
end;

procedure TForm1.Button12Click(Sender: TObject);
var ust:TIniFile;
begin
  ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
     ShellExecute(0,nil,'open',PChar(ust.ReadString('settings','pathOutput','c:\')),nil,SW_SHOWNORMAL);
     ust.Free;
end;

procedure TForm1.Button2Click(Sender: TObject); //elektrody...
var j,k:integer;
  el_exists:boolean;
begin
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
           if CheckBox4.Checked=False then Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ListBox7.Items[j]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5;0;'+ListBox12.Items[j]) //add parameters to invisible list
           else Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ListBox7.Items[j]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5;0;'+vdi_ii_to_nr(ComboBox2.ItemIndex)); // replace vdi
        end
        else begin
            if CheckBox4.Checked=False then Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ComboBox1.Items[ComboBox1.ItemIndex]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5;0;'+ListBox12.Items[j])  // replace material if choosen so
            else Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ComboBox1.Items[ComboBox1.ItemIndex]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5;0;'+vdi_ii_to_nr(ComboBox2.ItemIndex));  // replace material if choosen so + replace vdi
        end;
     end;
   end;
   Form2.CheckListBox1.ItemIndex:=0; //set position to first electrode
   Form2.Label11.Caption:=Edit3.Text; //copy program name
   Form2.editel(Form1);    // load values of first electrode into fields for editing
   ProgressBar1.Position:=0; //reset progress bar
   ProgressBar1.Max:=(Form2.ListBox1.Count)*10; //set max as number of electrodes times ten
   Timer1.Enabled:=True; //timer checks if Form2 finished.
   //Form2.ListBox1.Sorted:=True;
   //Form2.CHeckListBox1.Sorted:=True;
    Edit3.Enabled:=False; //to prevent change after already created folder
   Form2.Visible:=True; //show filled Form2
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  If Form1.Width=1000 then begin
     Form1.Width:=387;
     Form1.Height:=159;
     Button3.Caption:='Pokaż dane';
  end
  else begin
    Form1.Width:=1000;
    Form1.Height:=340;
    Button3.Caption:='Ukryj dane';
  end;
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

procedure TForm1.Button6Click(Sender: TObject);
var ust:TIniFile;
begin
     logToFile('line added manually to the table (el:'+Edit1.Text+', X:'+Edit2.Text+', Y:'+Edit4.Text+', C:'+Edit5.Text+', Z:'+Edit6.Text+', mat: '+Edit7.Text+', Fp: '+Edit8.Text+', dir: '+Edit9.Text+', ods: '+Edit10.Text+')','INF');
    ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    ListBox2.Items.Add(Edit1.Text);
    ListBox3.Items.Add(Edit2.Text);
    ListBox4.Items.Add(Edit4.Text);
    ListBox5.Items.Add(Edit5.Text);
    ListBox6.Items.Add(Edit6.Text);
    ListBox7.Items.Add(Edit7.Text);
    ListBox8.Items.Add(Edit8.Text);
    ListBox9.Items.Add(Edit9.Text);
    ListBox11.Items.Add(Edit10.Text);
    ListBox12.Items.Add(vdi_ii_to_nr(ComboBox3.ItemIndex));
    ust.Free;
end;

procedure TForm1.Button7Click(Sender: TObject);
var i,xc,yc,j,factor:integer;
  maxdim:real;
  recta:TRect;
begin
   logToFile('Grafickeck clicked','INF');
   Form1.WindowState:=wsMaximized;
   maxdim:=0;
   for i:=0 to ListBox3.Count-1 do begin
         if abs(strtofloat(ListBox3.Items[i]))>maxdim then maxdim:=abs(strtofloat(ListBox3.Items[i]))
     end;
    for i:=0 to ListBox4.Count-1 do begin
         if abs(strtofloat(ListBox4.Items[i]))>maxdim then maxdim:=abs(strtofloat(ListBox4.Items[i]))
     end;
    maxdim:=floor(maxdim)+5;
    Form1.Color:=clNavy;
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
   ListBox10.Visible:=False;
   ListBox1.Visible:=False;
   ListBox11.Visible:=False;
   ListBox12.Visible:=False;
   ListBox13.Visible:=False;
   CheckBox1.Visible:=False;
   //CheckBox2.Visible:=False;  // reversed checkbox - now done automatically
   CheckBox3.Visible:=False;
   CheckBox4.Visible:=False;
   Button9.Visible:=False;
   Button2.Visible:=False;
   Button3.Visible:=False;
   Button4.Visible:=False;
   Button5.Visible:=False;
   Button6.Visible:=False;
   Button10.Visible:=False;
   Button11.Visible:=False;
   ProgressBar1.Visible:=False;
   //SpinEdit1.Visible:=False;
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
   Label12.Visible:=False;
   Label14.Visible:=False;
   Label15.Visible:=False;
   Label16.Visible:=False;
   Label17.Visible:=False;
   ComboBox1.Visible:=False;
   ComboBox2.Visible:=False;
   ComboBox3.Visible:=False;
   Edit1.Visible:=False;
   Edit2.Visible:=False;
   Edit3.Visible:=False;
   Edit4.Visible:=False;
   Edit5.Visible:=False;
   Edit6.Visible:=False;
   Edit7.Visible:=False;
   Edit8.Visible:=False;
   Edit9.Visible:=False;
   Edit10.Visible:=False;
   GroupBox1.Visible:=False;
   //Button8.Left:=(floor(Panel1.Width/2)-floor(Button8.Width/2));
   //Button8.Top:=5;
   PaintBox1.Top:=10+Button7.Height;
   PaintBox1.Height:=Form1.Height-Button7.Height-50;
   PaintBox1.Left:=15;
   PaintBox1.Width:=Form1.Width-30;
   with PaintBox1.Canvas do
    begin
        Refresh;
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
        Font.Height:=16;
        repeat
        inc(factor);
        until (TextWidth('-3')*2)<((factor*floor(PaintBox1.Height/2))/maxdim); //fit dimensions to the screen
        maxdim:=maxdim*factor;
        repeat
        j:=j+factor;

        Font.Color:=clRed;
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
        Font.Height:=48;
        TextOut(PaintBox1.Width-50,(floor(PaintBox1.Height/2))-50,'X');
        TextOut(floor(PaintBox1.Width/2)+20,10,'Y');
        FOnt.Height:=16;
        until j>maxdim;
        Pen.Color:=clYellow;
        Brush.Color:=clYellow;
        Font.Color:=clYellow;
        Brush.Style:=bsClear;

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
    end;
   //if Sender.ClassName='TButton' then begin
   // Sleep(200);
   // Button7Click(Form1);
   // end;
end;

procedure TForm1.Button8Click(Sender: TObject);
var ust:TIniFile;
  path:string;
begin
 ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
   Form1.Color:=clDefault;
  Form1.WindowState:=wsNormal;
   Button7.Left:=304;
   Button7.Top:=64;
   Button8.Visible:=False;
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
   ListBox10.Visible:=True;
   ListBox1.Visible:=True;
   ListBox11.Visible:=True;
   ListBox12.Visible:=True;
   ListBox13.Visible:=True;
   CheckBox1.Visible:=True;
   //CheckBox2.Visible:=True;   //reversed checkbox - now done automatiaclly
   CheckBox3.Visible:=True;
   CheckBox4.Visible:=True;
   Button9.Visible:=True;
   Button2.Visible:=True;
   Button3.Visible:=True;
   Button4.Visible:=True;
   Button5.Visible:=True;
   Button6.Visible:=True;
   Button10.Visible:=True;
   Button11.Visible:=True;
   ProgressBar1.Visible:=True;
   //SpinEdit1.Visible:=True;
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
   Label12.Visible:=True;
   Label14.Visible:=True;
   Label15.Visible:=True;
   Label16.Visible:=True;
   path:=ust.readstring('settings','pathOutput','C:\Intel\LazarusPortable\dxf test\output');
   Label17.Visible:=directoryExists(path+'\'+Edit3.Text);
   ComboBox1.Visible:=True;
   ComboBox2.Visible:=True;
   COmboBox3.Visible:=True;
   Edit1.Visible:=True;
   Edit2.Visible:=True;
   Edit3.Visible:=True;
   Edit4.Visible:=True;
   Edit5.Visible:=True;
   Edit6.Visible:=True;
   Edit7.Visible:=True;
   Edit8.Visible:=True;
   Edit9.Visible:=True;
   Edit10.Visible:=True;
   GroupBox1.Visible:=True;
   ust.Free;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  logToFile('clicked open file button manually','INF');
  OpenDialog1.Execute;
  end_table_line:=0;
  CheckBox2.Checked:=False;
  Button1.Click;
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
end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
var ust:TIniFile;
  i:integer;
  dms,mcouts,mpouts:string;
  mcurrent,mprev:TDCP_sha256;
  mcout,mpout:array[0..31] of byte;
begin
    Form1.Width:=387;
    Form1.Height:=159;
    end_table_line:=0;
    plsr12sc:=False;
    tableno:=0;
    errorlevel:=0;
    ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    SpinEdit1.Value:=strtoint(ust.ReadString('settings','defaultNoOfRows','10'));
    OpenDialog1.InitialDir:=ust.ReadString('settings','pathDXF','C:\Intel\LazarusPortable\dxf test');
    Edit7.Text:=ust.ReadString('settings','defaultElectrodeMaterial','Graphite2');
    Edit10.Text:=ust.ReadString('settings','defaultSideOffset','5');
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
    ust.Free;
    logToFile('program opened','OK');
end;

procedure TForm1.handleparams(Sender: TObject);
begin
  if ParamCount>0 then begin
         OpenDialog1.FileName:=ParamStr(1);
         Button1.Click;
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
   Edit7.Text:=ListBox7.Items[(Sender as TListBox).ItemIndex];
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



procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  logToFile('opened settings','OK');
   // open new form with settings
   Form3.ShowModal;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  logToFile('About Form shown','OK');
  Form4.ShowModal; //about
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  logToFile('Help Form shown','OK');
   //modal form - user manual
  Form5.ShowModal;
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
   end;
end;



end.

