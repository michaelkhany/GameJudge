unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.StdCtrls, Vcl.CheckLst, Vcl.Themes, Vcl.Styles, Vcl.FileCtrl,
  Vcl.Buttons, Vcl.ExtDlgs;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    Panel1: TPanel;
    StringGrid1: TStringGrid;
    StatusBar1: TStatusBar;
    CheckListBox1: TCheckListBox;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    N24: TMenuItem;
    SelectAll1: TMenuItem;
    DeselectAll1: TMenuItem;
    PopupMenu2: TPopupMenu;
    ListBox1: TListBox;
    N25: TMenuItem;
    test1: TMenuItem;
    FileListBox1: TFileListBox;
    German1: TMenuItem;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Timer1: TTimer;
    SpeedButton2: TSpeedButton;
    SaveTextFileDialog1: TSaveTextFileDialog;
    PrintDialog1: TPrintDialog;
    RichEdit1: TRichEdit;
    SpeedButton3: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure N7Click(Sender: TObject);

    procedure Save2Temp();
    procedure Refresh1Click(Sender: TObject);
    procedure SelectAll1Click(Sender: TObject);
    procedure DeselectAll1Click(Sender: TObject);
    procedure test1Click(Sender: TObject);
    procedure SetLang(lname :string);
    procedure LoadLangDB_listMenu();
    procedure SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);

    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure German1Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CheckListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StatusBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  RandSeedNumTimer :integer;
  is_first_startup :boolean =true;
  var_LANGDB_DEF_PATH :string ='Lang\'; //complete on form show
const
  LANG :string ='R2L;'    +    (*0*)
'بازي;'+                       (*1*)
'فهرست ها;'  +                 (*2*)
'تنظيم;'+                      (*3*)
'شماره;'+                      (*4*)
'تيم 1;'+                      (*5*)
'تيم 2;'+                      (*6*)
'گروه بندي جديد;'+             (*7*)
'ذخيره اطلاعات;'+              (*8*)
'چاپ;'+                        (*9*)
'خروج;'+                       (*10*)
'بازخواني اطلاعات فهرست;'+     (*11*)
'چاپ فهرست تيم ها;'+           (*12*)
'برگشت به آخرين تغيير;'+       (*13*)
'زبان;'+                       (*14*)
'تنظيمات;'+                    (*15*)
'درباره ما...;'+               (*16*)
'تشکیل فهرست جدید;'+           (*17*)
'بازکردن پروژه;'+              (*18*)
'کمک';                         (*19*)
  LANG_WCount :integer =20;
implementation

uses Math, Unit2;

{$R *.dfm}

procedure TForm1.LoadLangDB_listMenu();
var
  lpath :string;
  i :integer;
begin
   lpath := var_LANGDB_DEF_PATH;
   try
   begin
         FileListBox1.Directory :=lpath;
   end;
   except
      MessageDlg('Language package''s folder is not reachable, default language selected.',mtWarning,mbOKCancel,0);
   end;

   N21.Enabled :=false;
   German1.Enabled :=false;

   for i := 0 to FileListBox1.Items.Count-1 do
   begin
     ListBox1.Items.LoadFromFile(lpath+FileListBox1.Items[i]);
     if ListBox1.Items.Count >= (LANG_WCount) then
     begin
        if (FileListBox1.Items[i].ToLower = 'english.lang') then
            N21.Enabled :=true;
        if (FileListBox1.Items[i].ToLower = 'german.lang') then
           German1.Enabled :=true;
     end;
   end;

   //ShowMessage(FileListBox1.Items.Text);
//   for i := 0 to FileListBox1.Items.Count-1 do
//   begin
//     ListBox1.Items.LoadFromFile(lpath+FileListBox1.Items[i]);
//     if ListBox1.Items.Count >= (LANG_WCount) then
//
//         else
//         begin
//            passed :=false;
//         end;
//   end;
end;

procedure TForm1.SetLang(lname :string);
var
  passed :boolean;
  lpath :string;
begin
   lpath := var_LANGDB_DEF_PATH+lname+'.lang';
   try
   begin
      if FileExists(lpath) then
      begin
         //ShowMessage('true');
         ListBox1.Items.LoadFromFile(lpath);
         if ListBox1.Items.Count >= (LANG_WCount) then
            passed :=true
         else
         begin
            passed :=false;
            MessageDlg('Error on disolving "'+lname+'" language package, default language selected.',mtError,mbOKCancel,0);
         end;
      end;
   end;
   except
      MessageDlg('Language package''s folder is not reachable, default language selected.',mtWarning,mbOKCancel,0);
   end;

   if passed then
   begin
     ListBox1.Items.LoadFromFile(lpath);

     if (ListBox1.Items[0].ToLower = 'r2l') then
      begin
        Form1.BiDiMode :=bdRightToLeft;
        Menu.BiDiMode :=bdRightToLeft;
        CheckListBox1.Align :=alLeft;
        StringGrid1.BiDiMode :=bdRightToLeft;
      end
      else
      begin
        Form1.BiDiMode :=bdLeftToRight;
        Menu.BiDiMode :=bdLeftToRight;
        CheckListBox1.Align :=alRight;
        StringGrid1.BiDiMode :=bdLeftToRight;
      end;
      N1.Caption :=ListBox1.Items[1];
      N2.Caption :=ListBox1.Items[2];
      N3.Caption :=ListBox1.Items[3];
      StringGrid1.Cells[0,0] :=ListBox1.Items[4];
      StringGrid1.Cells[1,0] :=ListBox1.Items[5];
      StringGrid1.Cells[2,0] :=ListBox1.Items[6];
      N5.Caption :=ListBox1.Items[7];
      N9.Caption :=ListBox1.Items[8];
      N11.Caption :=ListBox1.Items[9];
      N13.Caption :=ListBox1.Items[10];
      N14.Caption :=ListBox1.Items[11];
      //N16.Caption :=ListBox1.Items[12];
      N18.Caption :=ListBox1.Items[13];
      N19.Caption :=ListBox1.Items[14];
      N22.Caption :=ListBox1.Items[15];
      N23.Caption :=ListBox1.Items[16];
      N6.Caption :=ListBox1.Items[17];
      N7.Caption :=ListBox1.Items[18];
      N4.Caption :=ListBox1.Items[19];
   end
   else
   begin
      if (LANG.Split([';'])[0].ToLower = 'r2l') then
      begin
        Form1.BiDiMode :=bdRightToLeft;
        Menu.BiDiMode :=bdLeftToRight;
        CheckListBox1.Align :=alRight;
        StringGrid1.BiDiMode :=bdRightToLeft;
      end
      else
      begin
        Form1.BiDiMode :=bdLeftToRight;
        Menu.BiDiMode :=bdRightToLeft;
        CheckListBox1.Align :=alLeft;
        StringGrid1.BiDiMode :=bdLeftToRight;
      end;

      N1.Caption :=LANG.Split([';'])[1];
      N2.Caption :=LANG.Split([';'])[2];
      N3.Caption :=LANG.Split([';'])[3];
      StringGrid1.Cells[0,0] :=LANG.Split([';'])[4];
      StringGrid1.Cells[1,0] :=LANG.Split([';'])[5];
      StringGrid1.Cells[2,0] :=LANG.Split([';'])[6];
      N5.Caption :=LANG.Split([';'])[7];
      N9.Caption :=LANG.Split([';'])[8];
      N11.Caption :=LANG.Split([';'])[9];
      N13.Caption :=LANG.Split([';'])[10];
      N14.Caption :=LANG.Split([';'])[11];
      //N16.Caption :=LANG.Split([';'])[12];
      N18.Caption :=LANG.Split([';'])[13];
      N19.Caption :=LANG.Split([';'])[14];
      N22.Caption :=LANG.Split([';'])[15];
      N23.Caption :=LANG.Split([';'])[16];
      N6.Caption :=LANG.Split([';'])[17];
      N7.Caption :=LANG.Split([';'])[18];
      N4.Caption :=LANG.Split([';'])[19];
   end;

   //Application.CreateForm(TForm1, Form1);
  //Form1.RecreateWnd;
   Form1.Refresh;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  i, j, m, n: integer;
begin
   TRY
      m :=1; n :=0; i :=0; j :=CheckListBox1.Items.Count-1;

      if CheckListBox1.Items.Count >= 2 then
      begin
        StringGrid1.RowCount :=CheckListBox1.Items.Count;
        //StringGrid1.ColCount :=RichEdit1.Lines.count;
      end;
      while (i < j) do
      begin
        StringGrid1.Cells[0,m] :=inttostr(m);
        StringGrid1.Cells[1,m] :=CheckListBox1.Items.Strings[i];
        StringGrid1.Cells[2,m] :=CheckListBox1.Items.Strings[j];
        m :=m+1;

        if i <= CheckListBox1.Items.Count-1 then
          i :=i+1;
        if j >= 0 then
          j :=j-1;
      end;

   EXCEPT
   END;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  i :integer;
  RandTemp :integer;
begin
  if CheckListBox1.Items.Count <> StrToInt(Edit1.Text) then
  begin
    Save2Temp;
    //ShowMessage('');
  end;
  for i := 0 to CheckListBox1.Items.Count-StrToInt(Edit1.Text)-1 do
  begin
     RandSeed :=RandSeedNumTimer;
     RandTemp :=RandomRange(0,CheckListBox1.Items.Count-1);
     CheckListBox1.Items.Add(CheckListBox1.Items.Strings[randtemp]);
     CheckListBox1.Items.Delete(RandTemp);
  end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
//   if PrintDialog1.Execute then
//      RichEdit1.Print(PrintDialog1.GetNamePath);
  N11Click(self);
end;

procedure TForm1.StatusBar1Click(Sender: TObject);
begin
   Panel1.Show;
end;

procedure TForm1.StatusBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Panel1.Show;
end;

procedure TForm1.StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Panel1.Hide;
end;

procedure TForm1.Save2Temp();
const
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);
var
   StrTemp :TStrings;
   Temp :string;
   i ,j :integer;

  UTF8Str: UTF8String;
  FS: TFileStream;
begin
      Temp :=ExtractFilePath(Application.ExeName);
      //UTF8Str := UTF8Encode(RichEdit1.Text);
      //FS := TFileStream.Create(temp+'temp.txt', fmCreate);
      try
        //FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
        //FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
        CheckListBox1.Items.SaveToFile(Temp+'temp.txt');
      finally
        //FS.Free;
      end;

   StatusBar1.SimpleText :='Ready.';
end;

procedure TForm1.SelectAll1Click(Sender: TObject);
begin
   CheckListBox1.CheckAll(TCheckBoxState.cbChecked,false,false);
end;

procedure TForm1.test1Click(Sender: TObject);
begin
   SetLang('english');
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   StatusBar1.SimpleText :=' Teams Count: '+IntToStr(CheckListBox1.Items.Count)
   +', Total Games: '+IntToStr(StringGrid1.Row);
   if (RandSeedNumTimer < 5000000) then
      RandSeedNumTimer :=RandSeedNumTimer+1
   else
      RandSeedNumTimer :=0;
end;

procedure TForm1.CheckListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Panel1.Hide;
end;

procedure TForm1.DeselectAll1Click(Sender: TObject);
begin
  CheckListBox1.CheckAll(TCheckBoxState.cbUnchecked,false,false);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  TRY
   if Not((StrToInt(Edit1.Text) <= CheckListBox1.Items.Count) and ((StrToInt(Edit1.Text) >= 1))) then
      Edit1.Text :=IntToStr(Round(CheckListBox1.Items.Count/2));
  Except
    Edit1.Text :='0';
  End;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
   Edit1.SelectAll;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Case MessageDlg('در صورت خروج پنل کنوني شماازدست خواهد رفت، آيا از خروج خود ' +
      'مطمئنيد؟',mtWarning,mbOKCancel,0) of
     ID_OK:
     begin
       Action:= caFree;
       DeleteFile(ExtractFilePath(Application.ExeName)+'temp.txt');
     end;
     ID_CANCEL: Action :=caNone;

   end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if is_first_startup then
  begin
    var_LANGDB_DEF_PATH :=(ExtractFilePath(Application.ExeName)+var_LANGDB_DEF_PATH);

    SetLang('');

    LoadLangDB_listMenu();

    RandSeedNumTimer :=0;

    is_first_startup :=false;
  end;
end;

procedure TForm1.German1Click(Sender: TObject);
begin
   SetLang('german');
   German1.Checked :=true;
end;

procedure TForm1.N11Click(Sender: TObject);
var
  temp :string;
begin
   if PrintDialog1.Execute then
   begin
     temp :=ExtractFilePath(Application.ExeName);
     SaveStringGrid(StringGrid1,temp+'ResPrintTemp.tmp');
     RichEdit1.Clear;
     RichEdit1.Lines.LoadFromFile(UTF8Encode(temp+'ResPrintTemp.tmp'));
     RichEdit1.Print(PrintDialog1.GetNamePath);
     //MessageDlg('!پرينتر يافت نشد (Error 013-Z)',mtError,mbOKCancel,0);
   end;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
    Refresh;
    RichEdit1.Refresh;
    CheckListBox1.Refresh;
    StringGrid1.Refresh;
end;

procedure TForm1.N18Click(Sender: TObject);
var
  temp :string;
begin
   CheckListBox1.Clear;
   temp :=ExtractFilePath(Application.ExeName);
   if FileExists(temp+'temp.txt') then
      CheckListBox1.Items.LoadFromFile(UTF8Decode(temp+'temp.txt'));
   StatusBar1.SimpleText :='Ready.';
end;

procedure TForm1.N20Click(Sender: TObject);
begin
   SetLang('');
   N20.Checked :=true;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  SetLang('english');
  N21.Checked :=true;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
   form2.show();
end;

procedure TForm1.N23Click(Sender: TObject);
begin
   MessageDlg('GameJudge (TM) 2017 is under International copy-write laws.'+sLineBreak+
      '     All rights reserved for En. Michael Bidollahkhany'+sLineBreak+'Contact ' +
      'us for any suggestion: MichaelKhany@email.com',mtInformation,mbOKCancel,0);
end;

procedure TForm1.N6Click(Sender: TObject);
var
  i, j: integer;
begin
   case MessageDlg('درصورت ادامه پنل کنوني ازدست مي رود، آيا ادامه مي دهيد؟',
      mtWarning,mbAbortIgnore,0) of
     ID_IGNORE:
     begin
      CheckListBox1.Clear;
      CheckListBox1.Clear;
      for i := 0 to StringGrid1.ColCount do
        for j := 1 to StringGrid1.RowCount do
           StringGrid1.Cells[i,j] :='';

     end;
   end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
   Save2Temp;
   if OpenDialog1.Execute then
   begin
      CheckListBox1.Clear;
      //CheckListBox1.Items.LoadFromFile(OpenDialog1.FileName);
      CheckListBox1.Items.LoadFromFile(UTF8Encode(OpenDialog1.FileName));
      //CheckListBox1.Items.LoadFromFile(UTF8Decode(OpenDialog1.FileName));
   end;
end;

procedure TForm1.N9Click(Sender: TObject);
const
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);
var
   StrTemp :TStrings;
   m , Ext:string;
   i ,j :integer;

  UTF8Str: UTF8String;
  FS: TFileStream;
begin

   if SaveTextFileDialog1.Execute then
   begin
      Ext :='';
      if ExtractFileExt(SaveTextFileDialog1.FileName) = '' then
        Ext :='.txt';

//      UTF8Str := UTF8Encode(CheckListBox1.Text);
//      FS := TFileStream.Create(SaveTextFileDialog1.FileName+Ext, fmCreate);
//      try
//        FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
//        FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
//      finally
//        FS.Free;
//      end;
//
//      UTF8Str := UTF8Encode(CheckListBox1.Text);
//      FS := TFileStream.Create(ExtractFilePath(SaveTextFileDialog1.FileName)+ExtractFileName(SaveDialog1.FileName)+'_Others'+Ext, fmCreate);
//      try
//        FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
//        FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
//      finally
//        FS.Free;
//      end;
      CheckListBox1.Items.SaveToFile(SaveTextFileDialog1.FileName+Ext);

      SaveStringGrid(StringGrid1,ExtractFilePath(SaveTextFileDialog1.FileName)+
         ExtractFileName(SaveTextFileDialog1.FileName)+'_ResGrid'+Ext);
   end;
end;

procedure TForm1.SaveStringGrid(StringGrid: TStringGrid; const FileName: TFileName);
var
  f:   TextFile;
  i, k: Integer;
  temp :string;
begin
  AssignFile(f, FileName);
  Rewrite(f);
  with StringGrid do
  begin
    // Write number of Columns/Rows
    Writeln(f, ColCount);
    Writeln(f, RowCount);
    // loop through cells
    Write(F,'تيم2          ' +'           تيم1          '+'شماره بازي');
    Writeln(f,'');
    for i := 1 to RowCount - 1 do
    begin
      for k := 0 to ColCount - 1 do
      begin
        Write(F, '      '+Cells[k, i]);
      end;
        Writeln(f, '');
    end
  end;
  CloseFile(F);
end;



procedure TForm1.Refresh1Click(Sender: TObject);
begin
   CheckListBox1.Refresh;
end;

end.
