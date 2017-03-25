unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Comctrls, Spin, Menus, strings, Math, Unit2, Unit3, Unit4, Unit5 ,inifiles;

type
  TArrayOfString = array of String;
  TAAS = array of TArrayOfSTring;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label2: TLabel;
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
    OpenDialog1: TOpenDialog;
    ProgressBar1: TProgressBar;
    SpinEdit1: TSpinEdit;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure handleparams(Sender: TObject);
    procedure hp2(Sender: TObject; const FileNames: array of String);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure nospaces(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure scrollothers(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  end_table_line,offset:integer;

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
     while (i<=length(s)) and (s[i] in ['0'..'9','.']) do inc(i);
     result:=i>length(s);
end;

{ TForm1 }

procedure TForm1.scrollothers(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var rnumber,rname,str,dir,strat,gnam,z_in_mach,mach_add,z_in_geo,geo_add,geo_add2,iname,iusing,sp_coords:string;
  i,j,k,using_nr,amount_of_el,kapiel,last_using:integer;
  job,jor,tek,ter:TextFile;
  ust:TIniFile;
  p_elval,p_elam,isoval:TArrayOfString;
  min_z:real;
  phase,eip:Array[1..4] of integer;
  do_this_el:boolean;
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
     ust.Free;
     ProgressBar1.Position:=10;
     AssignFile(tek,dir+'\'+rname+'.TEK');
     rewrite(tek);  // .tek file is empty, but required
     CloseFile(tek);
     AssignFile(ter,dir+'\'+rname+'.TER');
     rewrite(ter);
     write(ter,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME detal:'+rnumber+';'); //another useless random number
     CloseFile(ter);
     ProgressBar1.Position:=20;
     AssignFile(jor,dir+'\'+rname+'.JOR');
     rewrite(jor);
     write(jor,'AGIE.VERSION 2,05.01.0;'+AnsiString(#10)+'.LONGNAME '+Edit3.Text+';'+AnsiString(#10)+'AGIE.USING_1 IMPORT COUNT_0 '+rname+'.TEK;'+AnsiString(#10)); //import empty technology file
     for i:=0 to Form2.ListBox1.Count-1 do begin
         p_elval:=SplitString(';',Form2.ListBox1.Items[i]);
         if Form2.CheckListBox1.Checked[i]=True then begin
            write(jor,'AGIE.USING_'+inttostr(i+2)+' IMPORT COUNT_1 '+p_elval[15]+'.FUT;'+AnsiString(#10)); //import every electrode for use in .JOB file
            last_using:=i+2;
         end;
     end;
     for i:=0 to Form2.ListBox1.Count-1 do begin
         p_elval:=SplitString(';',Form2.ListBox1.Items[i]);
         if p_elval[13]<>'Z' then begin
             iname:='ISO';
             randomize;
             for j:=1 to 5 do iname:=iname + str[random(length(str))+1];
             inc(last_using);
             ListBox10.Items.Add(p_elval[0]+';'+p_elval[13]+';'+p_elval[14]+';'+iname+';'+inttostr(last_using));
             write(jor,'AGIE.USING_'+inttostr(last_using)+' IMPORT COUNT_0 '+iname+'.ISO;'+AnsiString(#10)); //iso file for side eroding
         end;
     end;
     case ComboBox2.ItemIndex of //write the choosen surface quality
          0: write(jor,'AGIE.BEA_1 IMPORT COUNT_2 VDI_26Ra2.0oxxo,1,$,  2.000000,F,T,T,F,F;');
          1: write(jor,'AGIE.BEA_1 IMPORT COUNT_2 VDI_24_Ra1.59g oxxo,1,$,  1.590000,F,T,T,F,F;');
          2: write(jor,'AGIE.BEA_1 IMPORT COUNT_2 VDI_22Ra1.26oxxo,1,$,  1.260000,F,T,T,F,F;');
     end;
     CloseFile(jor);
     ProgressBar1.Position:=30;
     AssignFile(job,dir+'\'+rname+'.JOB');
     rewrite(job);
     if CheckBox3.Checked=True then gnam:='Group' //only create 1 group, to be copied on machine
     else gnam:='$';
     write(job,'TRON,05.01.0'+AnsiString(#10)+'J,$,x123,000,CNNPx,CNNPy,CNNCx,CNNCy,ZOOMPx,ZOOMPy,ZOOMCx,ZOOMCy,L,MinMax,Optmize'+AnsiString(#10)); //header
     write(job,'W,'+Edit3.Text+',4,000,0001,AGIE.BEA_1,,1,2,30,1,0,F,0,T,2,40,0.0000,0.0000,0.0000,0.0,0.0,0.0000,0.0,0.0,0.0,0.0,0.0,100,100,50,-50,-50,-50,30,1,0,KW,0,F,0,F,0,F,0,0,F,1.3,T,0.8,F,$,$,1,$,$,$,$,2,TipoEdit2,TipoGraph,65536,0,0,0,65536,0,5000,5000,1,TipoGraph,65536,0,0,0,65536,0,10000,10000,1');
     if CheckBox3.Checked= True then write(job,AnsiString(#10)+'G,'+gnam+','+inttostr(ListBox2.Count)+',+0.0000,+0.0000,0.0,0,0,0.0,0,0,0,0,0,1,1,1,1,0,F,0,T,2,40,AGIE.BEA_1,,0,1,0,0,F,0,F,0,0,F,1.3,0001,0,F,'+Edit3.Text+',$,2,1.0000,1.0000,2,65536,0,0,0,65536,0,10000,10000,1,TipoGraph,65536,0,0,0,65536,0,10000,10000,1');
     for i:=0 to ListBox2.Count-1 do begin //for every entry in table
         min_z:=200;
         for j:=0 to Form2.ListBox1.Count-1 do begin
             p_elval:=SplitString(';',Form2.ListBox1.Items[j]);
             min_z:=min(min_z,strtofloat(p_elval[7]));
             if trim(ListBox2.Items[i])=p_elval[0] then begin
               using_nr:=(j+2);
               if Form2.CheckListBox1.Checked[j]=True then do_this_el:=True
               else do_this_el:=False;
             end;
         end;
         kapiel:=40;
         if min_z<(strtofloat(ListBox6.Items[i])-20) then kapiel:=20; //TODO: test the exact value on machine
         if do_this_el=True then begin
            for j:=0 to Form2.ListBox1.Count-1 do begin  //find out el properties for eroding direction
                p_elam:=SplitString(';',Form2.ListBox1.Items[j]);
                if p_elam[0]=ListBox2.Items[i] then begin
                      if p_elam[13]<>'Z' then begin
                           iusing:='error';
                           for k:=0 to ListBox10.Count-1 do begin
                               isoval:=SplitString(';',ListBox10.Items[k]);
                               if isoval[0]=p_elam[0] then iusing:=isoval[4];
                           end;          //  v- this = Y-, C180
                           case p_elam[13] of
                                'X+': sp_coords:=p_elam[14]+', 0.0, 0';
                                'X-': sp_coords:='-'+p_elam[14]+', 0.0, 0';
                                'Y+': sp_coords:='0.0, '+p_elam[14]+', 0';
                                'Y-': sp_coords:='0.0, -'+p_elam[14]+', 0';
                           end;
                           //sp_coords:='0.0, 5.5, 0'; // TODO: x+/x-/y+/y-
                           z_in_mach:=ListBox6.Items[i];
                           mach_add:=' 8, 3; 0; '+p_elam[14]+'; 0; 0; 0';
                           z_in_geo:='0';
                           if iusing='error' then ShowMessage('Wrong using number for iso file!');
                           geo_add:='2,2,1,1,0.0,2,1,1,AGIE.USING_'+iusing;
                           geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,2,0,0,0,0,0,45,0,1,3,0,0,0,0,1,F,F,1,0,1,0,0,0,0,0,0,0,T,1,1,2,3,4,0,0,0,0,0,0,F,2,0,0,-1,2,1,1,0,0,0,0,0,0';
                      end
                      else begin
                           sp_coords:='0.0000,0.0000,3.0000';
                           z_in_mach:='0.0';
                           mach_add:='0,0';
                           z_in_geo:=ListBox6.Items[i];
                           geo_add:='2,1,1,1,0.0,0,1,2,';
                           geo_add2:='0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,0,0,0,0,0,0,5,0,0,0,0,0,45,1,1,3,0,0,0,0,1,F,T,1,0,1,0,0,0,0,0,0,0,F,1,1,2,3,4,0,0,0,0,0,0,F,1,0,0,0,1,1,1,0,0,0,0,0,0';
                      end;
                  end;
            end;                                                                                                                                                                                                                                                                                                                                                  // v bok zmienia tu
            if CheckBox3.Checked=True then write(job,AnsiString(#10)+'R,Mach'+inttostr(i)+','+ListBox3.Items[i]+','+ListBox4.Items[i]+','+z_in_mach+',0,0,'+ListBox5.Items[i]+',0,0,0,0,0,F,F,1,1,0,F,0,T,2,'+inttostr(kapiel)+',AGIE.USING_'+inttostr(using_nr)+',0,Geo_Mach'+inttostr(i)+',1,0001,AGIE.BEA_1,F,,StartPoint,6,,-1,1,0,0,0,0,T,5,F,T,T,T,F,0,0,0,1,0,'+mach_add+',0,0,0,0,1,0,0,0,134,'+gnam+','+Edit3.Text+',$,1.0000,1.0000,1,65536,0,0,0,65536,0,10000,10000,1'+AnsiString(#10))
            else                           write(job,AnsiString(#10)+'A,Mach'+inttostr(i)+','+ListBox3.Items[i]+','+ListBox4.Items[i]+','+z_in_mach+',0,0,'+ListBox5.Items[i]+',0,0,0,0,0,F,F,1,1,0,F,0,T,2,'+inttostr(kapiel)+',AGIE.USING_'+inttostr(using_nr)+',0,Geo_Mach'+inttostr(i)+',1,0001,AGIE.BEA_1,F,,StartPoint,5,,-1,1,0,0,0,0,T,5,F,T,T,T,F,0,0,0,1,0,'+mach_add+',0,0,0,0,1,0,0,0,138,'+Edit3.Text+',$,1.0000,1.0000,1,64420,11397,0,-11397,64420,0,11000,11000,1'+AnsiString(#10));
            write(job,'E,Geo_Mach'+inttostr(i)+',T,T,F,1,T,'+geo_add+',0,0,'+z_in_geo+',0,0,0,T,0,0.0,0.0,F,1,0,0,0,0,0,0,0,360,0,F,'+geo_add2+',Mach'+inttostr(i)+','+gnam+','+Edit3.Text+',$');
            //next lines for every physical electrode of this family (copy of .FUT information basically, but in slightly different format, cannot be copied)
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
             for j:=1 to amount_of_el do write(job,AnsiSTring(#10)+'p,0,'+inttostr(j)+',0,'+inttostr(phase[j])+','+inttostr(eip[j])+',0,3,32,127,0,1,0,1,10,35,35,1,5,0,20,50,50,1,0,0,0,0');
             for j:=1 to amount_of_el do write(job,AnsiString(#10)+'l,1,'+inttostr(j)+',0,'+inttostr(phase[j])+','+inttostr(eip[j])+',0,0,0,0,0,0,0');
             for j:=1 to amount_of_el do write(job,ANsiString(#10)+'a,2,'+inttostr(j)+',0,'+inttostr(phase[j])+','+inttostr(eip[j])+',0,0,1.000,1.000,2,0,5,0.020,0.008,0');
             write(job,AnsiString(#10)+'I,StartPoint,'+sp_coords+',0,3.0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,T,F,F,Mach'+inttostr(i)+','+gnam+','+Edit3.Text+',$');
         end; //do_this_el
     end;
     CloseFile(job);
     if ListBox10.Count>0 then begin //create iso files


     end;
     ProgressBar1.Position:=40;
     ShowMessage('Program '+Edit3.Text+' zapisany!'); //debug
     Application.Terminate;
   end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var fil:Textfile;
  sl,newsl:TStringList;
  acceptable_list:Array[1..20] of string;
  line,str:string; // single line of a dxf file
  res:TArrayOfString; //used for SplitString function output
  new_current_line,norm_line,current_line,start_line,text_per_item,i,j,k,col_id,col_x,col_y,col_c,col_z,col_mat,col_fp,col_dir,min_in_col,si,old_count,start_pos:integer;
  start_defined,assign_columns_done,table_done,col_count_found,is_acceptable,alternate_method:boolean;
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
    Button3.Enabled:=True;
    Form2.CheckListBox1.Clear;
    Form2.ListBox1.Clear;
    if OpenDialog1.FileName='n' then begin //for seeking another table without opening new file
       OpenDialog1.Execute;
       end_table_line:=0; //reset starting position
    end;
    if length(OpenDialog1.Filename)>3 then begin  // open file dialog, show error if no file is selected

    if CheckBox2.Checked=True then begin // reverse the dxf
       sl:=TStringList.Create;  //oop bullshit
       newsl:=TStringList.Create;  //oop bullshit
       sl.LoadFromFile(OpenDialog1.FileName); //load dxf into stringlist
       for si:=(sl.Count-1) downto 1 do newsl.Add(sl.Strings[si]); //reverse the stringlist
       sl.Destroy;
       newsl.SaveToFile(Application.Location+'temp.dxf'); //save reversed stringlist to temp file
       newsl.Destroy;
       AssignFIle(fil,Application.Location+'temp.dxf'); //use the temp file instead of the original dxf
    end
    else AssignFile(fil,OpenDialog1.FileName); //dxf file choosen by user
    reset(fil);                 //ensure reading from begining of the file
    current_line:=0;            //pre-set all varribles
    start_line:=0;
    start_defined:=False;
    assign_columns_done:=False;
    table_done:=False;
    alternate_method:=False;
    col_count_found:=False;  //it is here to allow tables of different column amount in the same dxf
    text_per_item:=30; // TODO: possibly change this to be readed from dxf file itself, it may vary
    ProgressBar1.Position:=10;
    repeat
      readln(fil,line);  //read 1 line
      //showmessage(line);
      inc(current_line);  //increase counter for line number
      if current_line>=end_table_line then begin // discarrd line numbers lower than start position, for second table
         if start_defined=False then res:=SplitString(':',line);
         if length(line)>=1 then begin //to avoid crashing on empty lines
            if start_defined=False then if ((res[0]='Electrodes are used for the following parts') or (res[0]='Elektroden werden fuer folgende Teile verwendet')) then begin //find start of position table
               Edit3.Text:=LeftStr(trim(res[1]),7); //save part number (turncate to prevent rare cases of long texi in this line)
               start_line:=current_line; //define starting point of position table
               //ShowMessage(inttostr(start_line));
               //for i:=1 to 50 do begin
               //       readln(fil,line);
                      //showmessage(line+' '+inttostr(i)+' '+inttostr(current_line));
               //       if ((trim(line)='ID no. for electrode') or (trim(line)='ID-NR') or (trim(line)='ELEKTR-NUMMER') or (trim(line)='Id-Nr Elektrode')) then begin
               //          start_line:=current_line+i-30;
               //          Showmessage(line+' '+inttostr(i));
               //       end;

               //end;
               //reset(fil);
               //new_current_line:=0;
               //for j:=1 to (current_line+2) do begin //go back to the line of table start
               //           inc(new_current_line);
               //           readln(fil,line);
               //       end;
               //       current_line:=new_current_line;
               //showmessage(inttostr(start_line));
               start_defined:=True;
               ProgressBar1.Position:=20;
            end;
            if start_defined=True then begin
               if col_count_found=False then begin //try to find first electrode name, in order to determine no of columns
                  //str:='0123456789';
                  for i:=1 to 15 do if current_line=(start_line+(i*text_per_item)) then begin
                      if length(trim(line))=7 then begin
                         if isNumber(trim(line)) then begin
                            col_count_found:=True;
                            //ShowMessage(line);
                            SpinEdit1.Value:=(((current_line-start_line) div text_per_item)-1); //save found table width
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
               if ListBox1.Count<SpinEdit1.Value then for i:=1 to SpinEdit1.Value do begin
               if current_line=(start_line+(i*text_per_item)+offset) then begin //every read 10 values, every 30 lines
                  is_acceptable:=False;
                  for j:=1 to 20 do if trim(line)=acceptable_list[j] then is_acceptable:=True;
                  if is_acceptable=False then begin
                     for k:=1 to 6 do begin
                         inc(offset);
                         readln(fil,line);
                     end;
                  end;
                  //showmessage(inttostr(current_line+offset)+' '+line+' ('+inttostr(offset)+')');
                  is_acceptable:=False;
                  for j:=1 to 20 do if trim(line)=acceptable_list[j] then is_acceptable:=True;
                  if is_acceptable=True then ListBox1.Items.Add(line); //add those lines to listbox
                  break;
               end;
               if ((length(trim(line))=7) and (isNumber(trim(line)))) then break;
               end;
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

                   end;
                   if line='ENDBLK' then begin
                      table_done:=True;  //do not continue after this
                      end_table_line:=(current_line+1); //start line to search for next table
                      ProgressBar1.Position:=40;
                   end;
                   end
                   else begin
                        //TODO the strange dxf files vit varrible distances
                        current_line:=current_line+offset;
                        offset:=0;
                        alternate_method:=True;
                        //the actual alternathe method below

                   end;
               end;
               if ListBox1.Count=SpinEdit1.Value then if assign_columns_done=False then begin //assign columns when all read, if not already done
                  //pre-set varribles to 9999 - means no column present, high value = no common multiplier in low numbers
                  col_id:=9999;
                  col_x:=9999;
                  col_y:=9999;
                  col_z:=9999;
                  col_c:=9999;
                  col_mat:=9999;
                  col_fp:=9999;
                  col_dir:=9999;
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
                           'TIEFE': col_z:=i; //german
                           'WINKEL': col_c:=i; //german
                           'Drehwinkel': col_c:=i; //german alt
                           'Senktiefe': col_z:=i; //german alt
                           'Elektrodenwerkstoff': col_mat:=i; //german
                           'Eroding direction': col_dir:=i;
                      end;
                  end;
                  //ShowMessage('id '+inttostr(col_id)+', X '+inttostr(col_x)+', Y '+inttostr(col_y)+', Z '+inttostr(col_z)+', C '+inttostr(col_c)+', material '+inttostr(col_mat)+', Fp '+inttostr(col_fp)); //debug message
                  assign_columns_done:=True; //mark this done, so it wont happen again
                  ProgressBar1.Position:=30;
               end;
               end; // col count found=true
            end; //start defined=true
         end;  //length of line >1
      end; //current line>= end table line
    until eof(fil);
    CloseFile(fil);
    //showmessage('k');
    ProgressBar1.Position:=50;
    //evaluation of data
    //min_in_col:=min(min(ListBox2.Count,ListBox3.Count),min(ListBox4.Count,ListBox5.Count)); //minimum is the actal data, more is not needed
    //if ListBox2.Count>min_in_col then ListBox2.Items.Delete(min_in_col); //delete last text that is not electrode name
    //if ListBox3.Count>min_in_col then ListBox3.Items.Delete(min_in_col);
    //if ListBox4.Count>min_in_col then ListBox4.Items.Delete(min_in_col);
    //if ListBox5.Count>min_in_col then ListBox5.Items.Delete(min_in_col);
    ProgressBar1.Position:=60;
    //delete additional things (for reverse order)
    if ListBox2.Count>0 then begin
       start_pos:=0;
       i:=0;
       repeat
         //showmessage(inttostr(length(ListBox2.Items[i])));
       if length(ListBox2.Items[i])<>7 then start_pos:=i;
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
    if ListBox2.Count>0 then begin
       old_count:=ListBox5.Count-1;
       if (ListBox5.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox5.Items.Delete(j);
       old_count:=ListBox7.Count-1;
       if (ListBox7.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox7.Items.Delete(j);
       old_count:=ListBox8.Count-1;
       if (ListBox8.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox8.Items.Delete(j);
       old_count:=ListBox9.Count-1;
       if (ListBox9.Count)>start_pos then for j:=old_count downto (start_pos) do ListBox9.Items.Delete(j);
    end;
    ProgressBar1.Position:=70;
    Button2.Enabled:=True; // elektrody...
    Button3.Enabled:=True; // pokaz dane
    if length(Edit3.Text)<2 then ShowMessage('Niepoprawny plik DXF!');
    end //no file selected
    else ShowMessage('Nie wybrano pliku');
    if (CheckBox2.Checked=False) then begin
       if ListBox1.Count=0 then begin
          CheckBox2.Checked:=True;
          end_table_line:=0;
          Button1.Click;
       end
       else if ((ListBox1.Items[0]<>'ID no. for electrode') and (ListBox1.Items[0]<>'ID-NR') and (ListBox1.Items[0]<>'ELEKTR-NUMMER') and (ListBox1.Items[0]<>'Id-Nr Elektrode')) then begin //no valid table found
           // if CheckBox2.Checked=False then begin
           //    CheckBox2.Checked:=True; //check button for reversing dxf file
           //    end_table_line:=0;
           //    Button1.Click; //run search for table again
           // end
           ShowMessage('Koniec pliku, nie znaleziono tabeli!');
       end;
    end
    else if ListBox1.Count=0 then ShowMessage('Nie wykryto tabeli z pozycjami elektrod w pliku '+OpenDialog1.FileName);
    showmessage(inttostr(offset));
end;

procedure TForm1.Button2Click(Sender: TObject); //elektrody...
var j,k:integer;
  el_exists:boolean;
begin
   for j:=0 to (ListBox2.Count-1) do begin //for each position in table
     el_exists:=False; //mar electrode as not exist
     if Form2.CheckListBox1.Count>0 then begin
        for k:=0 to (Form2.CheckListBox1.Count-1) do begin //for each already known electrode
            if Form2.CheckListBox1.Items[k]=trim(ListBox2.Items[j]) then el_exists:=True; //mark electrode that already exist
        end;
     end;
     if el_exists=False then begin //if electrode is marked not existing
        Form2.CheckListBox1.Items.Add(trim(ListBox2.Items[j])); //add to visible list
        Form2.CheckListBox1.Checked[(Form2.CheckListBox1.Count-1)]:=True;
        if CheckBox1.Checked=False then Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ListBox7.Items[j]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5') //add parameters to invisible list
        else Form2.ListBox1.Items.Add(trim(ListBox2.Items[j])+';'+ComboBox1.Items[ComboBox1.ItemIndex]+';'+ListBox8.Items[j]+';0;0;0;0;0;0;0;0;'+trim(ListBox2.Items[j])+';0;'+ListBox9.Items[j]+';5');  // replace material if choosen so
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
  If Form1.Width=1015 then begin
     Form1.Width:=415;
     Form1.Height:=159;
     Button3.Caption:='Pokaż dane';
  end
  else begin
    Form1.Width:=1015;
    Form1.Height:=340;
    Button3.Caption:='Ukryj dane';
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
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
      ListBox2.ItemIndex:=-1;
   end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
var ust:TIniFile;
begin
    Form1.Width:=415;
    Form1.Height:=159;
    end_table_line:=0;
    ust:=TIniFile.Create(ChangeFileExt(Application.ExeName,'.ini'));
    SpinEdit1.Value:=strtoint(ust.ReadString('settings','defaultNoOfRows','10'));
    OpenDialog1.InitialDir:=ust.ReadString('settings','pathDXF','C:\Intel\LazarusPortable\dxf test');
    ust.Free;
    //ShowMessage(Application.ExeName);

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

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
   // open new form with settings
   Form3.ShowModal;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Form4.ShowModal; //about
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
   //modal form - user manual
  Form5.ShowModal;
end;

procedure TForm1.nospaces(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
   (Sender as TEdit).Text:=StringReplace((Sender as TEdit).Text,' ','_',[rfReplaceAll]);
   (Sender as TEdit).Text:=StringReplace((Sender as TEdit).Text,'-','_',[rfReplaceAll]);
   (Sender as TEdit).SelStart:=high(Integer);
end;



end.

