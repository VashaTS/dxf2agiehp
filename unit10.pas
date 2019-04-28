unit Unit10;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil;

type
  TDataModule1 = class(TDataModule)

  private
    { private declarations }
  public
    { public declarations }
      function getString(lang:String;num:integer):string;
  end;


var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}
function TDataModule1.getString(lang:String;num:integer):string;
var str:Array of Array of String;
  ln:integer;
begin
    SetLength(str,3);
    SetLength(str[0],100);
    SetLength(str[1],100);
    SetLength(str[2],100);

    case lang of
        'PL': ln:=0;
        'EN': ln:=1;
        'DE': ln:=2;
        else ln:=0;
    end;
    //PL Main menu
    str[0,0]:='Plik';
    str[0,1]:='Opcje...';
    str[0,2]:='Pomoc';
    str[0,3]:='Nowy';
    str[0,4]:='Import...';
    str[0,5]:='Eksport...';
    str[0,6]:='Otwórz EDF';
    str[0,7]:='Zapisz';
    str[0,8]:='Zapisz jako';
    str[0,9]:='Drukuj tabele';
    str[0,10]:='Zakończ';
    str[0,11]:='Ustawienia';
    str[0,12]:='Pokaż Log';
    str[0,13]:='O programie';
    str[0,14]:='Jak używać';
    str[0,15]:='Otwórz istniejący program Agie HP / X400';
    str[0,16]:='Import CSV (Z SEB)';
    str[0,17]:='Import DXF/MI';
    str[0,18]:='AgieVision (.JOB , .FUT)';
    str[0,19]:='HMI (.xmlj)';
    str[0,20]:='CERTA (.csv)';
    //PL Form1
    str[0,21]:='Zastąp materiał elektrody';
    //PL Form2
    //PL settings
    //PL about

    //EN Main menu
    str[1,0]:='File';
    str[1,1]:='Options...';
    str[1,2]:='Help';
    str[1,3]:='New';
    str[1,4]:='Import...';
    str[1,5]:='Export...';
    str[1,6]:='Open EDF';
    str[1,7]:='Save';
    str[1,8]:='Save as';
    str[1,9]:='Print table';
    str[1,10]:='Exit';
    str[1,11]:='Settings';
    str[1,12]:='Show Log';
    str[1,13]:='About';
    str[1,14]:='How to use';
    str[1,15]:='Open existing program AgieVision / HMI';
    str[1,16]:='Import CSV (from SEB)';
    str[1,17]:='Import DXF/MI';
    str[1,18]:='AgieVision (.JOB , .FUT)';
    str[1,19]:='HMI (.xmlj)';
    str[1,20]:='CERTA (.csv)';

    //DE Main menu
    str[2,0]:='Datei';
    str[2,1]:='Optionen...';
    str[2,2]:='Hilfe';
    str[2,3]:='Neu';
    str[2,4]:='Importieren...';
    str[2,5]:='Export...';
    str[2,6]:='Öffen EDF';
    str[2,7]:='Speichern';
    str[2,8]:='Speicharn als';
    str[2,9]:='Tabellen drucken';
    str[2,10]:='Ausfahrt';
    str[2,11]:='Einstellungen';
    str[2,12]:='Protokoll anzeigen';
    str[2,13]:='Über';
    str[2,14]:='Wie benutzt man';
    str[2,15]:='Öffen Sie das vorhandene Programm AgieVision / HMI';
    str[2,16]:='Importieren CSV (aus SEB)';
    str[2,17]:='Importieren DXF/MI';
    str[2,18]:='AgieVision (.JOB , .FUT)';
    str[2,19]:='HMI (.xmlj)';
    str[2,20]:='CERTA (.csv)';

    result:=str[ln,num];
end;
end.

