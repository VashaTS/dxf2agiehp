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
  ln,len:integer;
begin
    len:=100;
    SetLength(str,3);
    SetLength(str[0],len);
    SetLength(str[1],len);
    SetLength(str[2],len);

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
    str[0,22]:='Zastąp jakość powierzchni';
    str[0,23]:='Materiał detalu';
    str[0,24]:='Nazwa programu';
    str[0,25]:='Utwórz grupę';
    str[0,26]:='Tylko dla Agie Hyperspark (AGIEVISON)';
    str[0,27]:='Ułatwia kopiowanie na maszynie';
    str[0,28]:='Już istnieje!';
    str[0,29]:='Odległość: Referencje detalu -> Punkt pomiarowy';
    str[0,30]:='Pozycje detali w magazynie';
    str[0,31]:='Dodaj skaner';
    str[0,32]:='usuń dane el';
    str[0,33]:='Elektrody...';
    str[0,34]:='Szukaj innej tabeli';
    str[0,35]:='Sortuj:';
    str[0,36]:='nazwa';
    str[0,37]:='Pole powierzchni styku elektrody z detalem';
    str[0,38]:='jednostka: cm²';
    str[0,39]:='Otwórz plik z maszyny pomiarowej'; //opendialog3
    str[0,40]:='Koniec'; // in graficheck
    str[0,41]:='Poprawne pozycje magazynu:';
    str[0,42]:='Numer rewizji';
    str[0,43]:='Dodaj linie';
    str[0,44]:='Akceptuj zmiany';
    str[0,45]:='Kopiuj linię';
    str[0,46]:='Usuń linię';
    str[0,47]:='Kopiuj wszystkie';
    str[0,48]:='Wyślij';
    str[0,90]:='Poprawne wartości:'; //eroding direction hint
    //PL Form2
    str[0,49]:='elektroda';
    str[0,50]:='Odwróć zaznaczenie';
    str[0,51]:='podwymiar';
    str[0,52]:='Z ręcznie';
    str[0,53]:='Anuluj';
    str[0,54]:='Kolejna elektroda';
    str[0,55]:='Koniec - zapisz';
    str[0,56]:='Typ podwymiaru';
    str[0,57]:='Boczny';
    str[0,58]:='Jednakowo odległy';
    str[0,59]:='Lista elektrod';
    //PL settings
    str[0,60]:='Domyślny materiał elektrody';
    str[0,61]:='Domyślny materiał detalu';
    str[0,62]:='Ścieżka folderu';
    str[0,63]:='Domyślna odległość punktu startowego';
    str[0,64]:='Domyślne odsunięcie Z';
    str[0,65]:='Pomiary X i Y elektrod z preseta są obrócone o kąt C';
    str[0,66]:='Dodatkowa linia między każdym wierszem tabeli';
    str[0,67]:='Strategia tworzenia elektrod';
    str[0,68]:='1 zgr, reszta p-wyk';
    str[0,69]:='2 zgr, 2 p-wyk lub 1 zgr 2 p-wyk';
    str[0,70]:='2 zgr, 1 p-wyk, 1 wyk';
    str[0,71]:='Utwórz folder dla programu';
    str[0,72]:='Wyślij na pendrive';
    str[0,73]:='Pokazuj export do';
    str[0,74]:='Kolejność pól elektrod';
    str[0,75]:='Rysuj detal, zdefiniowany poniżej';
    str[0,76]:='Naroże';
    str[0,77]:='Długość linii wyznaczającej kierunek';
    str[0,78]:='Kod języka';
    str[0,79]:='Dostępne języki:';
    str[0,80]:='Zapisz';
    str[0,81]:='Ustawienia';
    //PL about
    str[0,82]:='wersja';
    str[0,83]:='Autor programu';
    str[0,84]:='O Programie';
    //PL copying
    str[0,85]:='Kopiowanie';
    str[0,86]:='Środek X';
    str[0,87]:='Środek Y';
    str[0,88]:='Kąt obrotu';
    str[0,89]:='Rotacja kopii';
    str[0,90]:='Ilość kopii';
    str[0,91]:='funkcje kopiowania';
    str[0,92]:='Zwiększenie';
    str[0,93]:='Ilość kolumn';
    str[0,94]:='Ilość wierszy';

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
    //EN form1
    str[1,21]:='Replace electrode material';
    str[1,22]:='Replace surface quality';
    str[1,23]:='Workpiece material';
    str[1,24]:='Program name';
    str[1,25]:='Create group';
    str[1,26]:='Only for Agie Hyperspark (AGIEVISON)';
    str[1,27]:='Makes copying easy on machine';
    str[1,28]:='Already exists!';
    str[1,29]:='Distance: Workpiece reference -> Measurment point';
    str[1,30]:='Position of workpieces in magazine';
    str[1,31]:='Add scanner';
    str[1,32]:='del el data';
    str[1,33]:='Electrodes...';
    str[1,34]:='Look for another table';
    str[1,35]:='Sort:';
    str[1,36]:='name';
    str[1,37]:='Area of electrode touching workpiece';
    str[1,38]:='unit: cm²';
    str[1,39]:='Open file from CMM'; //opendialog3
    str[1,40]:='End'; // in graficheck
    str[1,41]:='Valid magazine positions:';
    str[1,42]:='revision number';
    str[1,43]:='Add line';
    str[1,44]:='Accept changes';
    str[1,45]:='Copy line';
    str[1,46]:='Delete line';
    str[1,47]:='Copy all';
    str[1,48]:='Send';
    str[1,90]:='Accepted values:'; //eroding direction hint
    //EN form 2
    str[1,49]:='electrode';
    str[1,50]:='Invert selection';
    str[1,51]:='undersize';
    str[1,52]:='Z by hand';
    str[1,53]:='Cancel';
    str[1,54]:='Next electrode';
    str[1,55]:='Finished - save';
    str[1,56]:='Undersize type';
    str[1,57]:='Lateral';
    str[1,58]:='Equidistant';
    str[1,59]:='Electrode List';
    //EN settings
    str[1,60]:='Default electrode material';
    str[1,61]:='Default workpiece material';
    str[1,62]:='Folder path';
    str[1,63]:='Default StartPoint distance';
    str[1,64]:='Default offset Z';
    str[1,65]:='Measurements X & Y of electrodes from CMM are calculated by angle C';
    str[1,66]:='Interline between every row in Print table';
    str[1,67]:='Strategy of creating electrodes';
    str[1,68]:='1 rough, reszta pre-finish';
    str[1,69]:='2 rough, 2 pre-finish or 1 rough 2 pre-finish';
    str[1,70]:='2 rough, 1 pre-finish, 1 finish';
    str[1,71]:='Create folder for program';
    str[1,72]:='Send to pendrive';
    str[1,73]:='Show export to';
    str[1,74]:='Order of fields for electrodes';
    str[1,75]:='Draw workpiece, as defined below';
    str[1,76]:='Corner';
    str[1,77]:='Length of direction line';
    str[1,78]:='Language code';
    str[1,79]:='Available languages:';
    str[1,80]:='Save';
    str[1,81]:='Settings';
    //EN about
    str[1,82]:='version';
    str[1,83]:='Program author';
    str[1,84]:='About';
    //EN copying
    str[1,85]:='Copying';
    str[1,86]:='Center X';
    str[1,87]:='Center Y';
    str[1,88]:='Rotation angle';
    str[1,89]:='Angle of copy';
    str[1,90]:='Amount of copies';
    str[1,91]:='copying functions';
    str[1,92]:='Increase';
    str[1,93]:='Collumns amount';
    str[1,94]:='Rows amount';

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
    //DE form1
    str[2,21]:='Ersetzen Elektrodenmaterial';
    str[2,22]:='Ersetzen Oberflächenqualität';
    str[2,23]:='Werkstrückmaterial';
    str[2,24]:='Programmname';
    str[2,25]:='Gruppe erstellen';
    str[2,26]:='Nur für Agie Hyperspark (AGIEVISON)';
    str[2,27]:='vereinfacht das Kopieren auf der Maschine';
    str[2,28]:='ist bereits vorhanden!';
    str[2,29]:='Entfernung: Werkstrück referenz -> Messpunkt';
    str[2,30]:='Position des Werkstrücks im magazin';
    str[2,31]:='Sonde hinzufügen';
    str[2,32]:='del el daten';
    str[2,33]:='Elektroden...';
    str[2,34]:='Suchen Sie nach anderen Daten';
    str[2,35]:='Sortieren:';
    str[2,36]:='Name';
    str[2,37]:='Bereich der Elektrode, der das Werkstrück berührt';
    str[2,38]:='Einheit: cm²';
    str[2,39]:='Datei öffen von CMM'; //opendialog3
    str[2,40]:='Ende'; // in graficheck
    str[2,41]:='Gültige Magazinpositionen:';
    str[2,42]:='Revisionsnummer';
    str[2,43]:='Zeile hinzufügen';
    str[2,44]:='Änderungen speichern';
    str[2,45]:='Zeile kopieren';
    str[2,46]:='Zeile löschen';
    str[2,47]:='Kopiere alles';
    str[2,48]:='Senden';
    str[2,90]:='korrekte Werte'; //eroding direction hint
    //DE form2
    str[2,49]:='Elektrode';
    str[2,50]:='Auswahl umkehren';
    str[2,51]:='untermass';
    str[2,52]:='Z von Hand';
    str[2,53]:='Stornieren';
    str[2,54]:='Nächste Elektrode';
    str[2,55]:='Fertig - speichern';
    str[2,56]:='Untermass Typ';
    str[2,57]:='seitlich';
    str[2,58]:='äquidistant';
    str[2,59]:='Elektrodenliste';
    //DE settings
    str[2,60]:='Standard Elektrodenmaterial';
    str[2,61]:='Standard Werkstrückmaterial';
    str[2,62]:='Verzeichnispfad';
    str[2,63]:='Standard StartPunkt Entfernung';
    str[2,64]:='Standard offset Z';
    str[2,65]:='CMM Messungen X & Y von elektroden sind berechnet nach Winkel C';
    str[2,66]:='Linie zwischen jeder Reihe in Tabelle Drucken';
    str[2,67]:='Strategie der Elektrodenbildung';
    str[2,68]:='1 rough, reszta pre-finish';
    str[2,69]:='2 rough, 2 pre-finish or 1 rough 2 pre-finish';
    str[2,70]:='2 rough, 1 pre-finish, 1 finish';
    str[2,71]:='Ordner für Programm erstellen';
    str[2,72]:='Senden an Pendrive';
    str[2,73]:='Zeige Export nach';
    str[2,74]:='Reihenfolge der Felder - Elektrodenliste';
    str[2,75]:='Werkstrück zeichnen, wie inten definiert';
    str[2,76]:='Ecke';
    str[2,77]:='Länge der Richtungsline';
    str[2,78]:='Sprachcode';
    str[2,79]:='Verfügbare Sprachen:';
    str[2,80]:='Speichern';
    str[2,81]:='Einstellungen';
    //DE about
    str[2,82]:='Ausführung';
    str[2,83]:='Autor';
    str[2,84]:='Uber'; //+umlaut
    //DE copying
    str[2,85]:='Kopiowanie';
    str[2,86]:='Środek X';
    str[2,87]:='Środek Y';
    str[2,88]:='Kąt obrotu';
    str[2,89]:='Rotacja kopii';
    str[2,90]:='Ilość kopii';
    str[2,91]:='funkcje kopiowania';
    str[2,92]:='Zwiększenie';
    str[2,93]:='Ilość kolumn';
    str[2,94]:='Ilość wierszy';

    result:=str[ln,num];
end;
end.

