unit tst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, Grids, Buttons, CheckLst;

type
  TForm1 = class(TForm)
    Bevel1: TBevel;
    ScrollBox1: TScrollBox;
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
    N14: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    OpenDialog1: TOpenDialog;
    PrintDialog1: TPrintDialog;
    ScrollBox2: TScrollBox;
    SpeedButton1: TSpeedButton;
    StringGrid1: TStringGrid;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Edit1: TEdit;
    CheckListBox1: TCheckListBox;
    RichEdit1: TRichEdit;
    Label1: TLabel;
    SpeedButton2: TSpeedButton;
    Timer1: TTimer;
    N24: TMenuItem;
    N25: TMenuItem;
    SaveDialog1: TSaveDialog;
    SpeedButton3: TSpeedButton;
    BitBtn1: TBitBtn;
    RichEdit2: TRichEdit;
    ProgressBar1: TProgressBar;
    RichEdit3: TRichEdit;
    N12: TMenuItem;
    N13: TMenuItem;

    procedure Save2Temp();
    procedure N4Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure StringGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure StatusBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveStringGrid(StringGrid: TStringGrid; const FileName:
       TFileName);
    procedure RichEdit2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Edit1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N14Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  RandSeedNumTimer :integer;
implementation

uses Math;

//{$R *.dfm}

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
      UTF8Str := UTF8Encode(RichEdit1.Text);
      FS := TFileStream.Create(temp+'temp.txt', fmCreate);
      try
        FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
        FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
      finally
        FS.Free;
      end;

   StatusBar1.SimpleText :='Ready.';
end;

procedure TForm1.N4Click(Sender: TObject);
begin
   Save2Temp;
   if OpenDialog1.Execute then
   begin
      RichEdit1.Clear;
      //CheckListBox1.Items.LoadFromFile(OpenDialog1.FileName);
      RichEdit1.Lines.LoadFromFile(UTF8Encode(OpenDialog1.FileName));
      //CheckListBox1.Items.LoadFromFile(UTF8Decode(OpenDialog1.FileName));
   end;

end;

procedure TForm1.StatusBar1Click(Sender: TObject);
begin
   Panel1.Show;
end;

procedure TForm1.StringGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   Panel1.Hide;
end;

procedure TForm1.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Panel1.Hide;
end;

procedure TForm1.StatusBar1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
   Panel1.Show;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  i, j, m, n: integer;
begin
   TRY
      m :=1; n :=0; i :=0; j :=RichEdit1.Lines.Count-1;

      if RichEdit1.Lines.Count >= 2 then
      begin
        StringGrid1.RowCount :=RichEdit1.Lines.Count;
        //StringGrid1.ColCount :=RichEdit1.Lines.count;
      end;
      while (i < j) do
      begin
        StringGrid1.Cells[0,m] :=inttostr(m);
        StringGrid1.Cells[1,m] :=RichEdit1.Lines.Strings[i];
        StringGrid1.Cells[2,m] :=RichEdit1.Lines.Strings[j];
        m :=m+1;

        if i <= RichEdit1.Lines.Count-1 then
          i :=i+1;
        if j >= 0 then
          j :=j-1;
      end;

   EXCEPT
   END;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   StringGrid1.Cells[0,0] :='�����';
   StringGrid1.Cells[1,0] :='��� 1';
   StringGrid1.Cells[2,0] :='��� 2';
   RandSeedNumTimer :=0;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  TRY
   if Not((StrToInt(Edit1.Text) <= RichEdit1.Lines.Count) and ((StrToInt(Edit1.Text) >= 1))) then
      Edit1.Text :=IntToStr(Round(RichEdit1.Lines.Count/2));
  Except
    Edit1.Text :='0';
  End;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
   StatusBar1.SimpleText :=' Teams Count: '+IntToStr(RichEdit1.Lines.Count)
   +', Total Games: '+IntToStr(StringGrid1.Row);
   if (RandSeedNumTimer < 5000000) then
      RandSeedNumTimer :=RandSeedNumTimer+1
   else
      RandSeedNumTimer :=0;

end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  i :integer;
  RandTemp :integer;
begin
  if RichEdit1.Lines.Count <> StrToInt(Edit1.Text) then
  begin
    Save2Temp;
    //ShowMessage('');
  end;
  for i := 0 to RichEdit1.Lines.Count-StrToInt(Edit1.Text)-1 do
  begin
     RandSeed :=RandSeedNumTimer;
     RandTemp :=RandomRange(0,RichEdit1.Lines.Count-1);
     RichEdit2.Lines.Add(RichEdit1.Lines.Strings[randtemp]);
     RichEdit1.Lines.Delete(RandTemp);
  end;
end;

procedure TForm1.N24Click(Sender: TObject);
var
  temp :string;
begin
   RichEdit2.Clear;
   temp :=ExtractFilePath(Application.ExeName);
   if FileExists(temp+'temp.txt') then
      RichEdit1.Lines.LoadFromFile(UTF8Decode(temp+'temp.txt'));
   StatusBar1.SimpleText :='Ready.';
end;

procedure TForm1.N3Click(Sender: TObject);
var
  i, j: integer;
begin
   case MessageDlg('������ ����� ��� ����� ����� �� ��ϡ ��� ����� �� ���Ͽ',
      mtWarning,mbAbortIgnore,0) of
     ID_IGNORE:
     begin
      RichEdit1.Clear;
      RichEdit2.Clear;
      for i := 0 to StringGrid1.ColCount do
        for j := 1 to StringGrid1.RowCount do
           StringGrid1.Cells[i,j] :='';

     end;
   end;
end;

procedure TForm1.N6Click(Sender: TObject);
const
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);
var
   StrTemp :TStrings;
   m , Ext:string;
   i ,j :integer;

  UTF8Str: UTF8String;
  FS: TFileStream;
begin

   if SaveDialog1.Execute then
   begin
      Ext :='';
      if ExtractFileExt(SaveDialog1.FileName) = '' then
        Ext :='.txt';

      UTF8Str := UTF8Encode(RichEdit1.Text);
      FS := TFileStream.Create(SaveDialog1.FileName+Ext, fmCreate);
      try
        FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
        FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
      finally
        FS.Free;
      end;

      UTF8Str := UTF8Encode(RichEdit2.Text);
      FS := TFileStream.Create(ExtractFilePath(SaveDialog1.FileName)+ExtractFileName(SaveDialog1.FileName)+'_Others'+Ext, fmCreate);
      try
        FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
        FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
      finally
        FS.Free;
      end;

      SaveStringGrid(StringGrid1,ExtractFilePath(SaveDialog1.FileName)+
         ExtractFileName(SaveDialog1.FileName)+'_ResGrid'+Ext);
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
    Write(F,'���2          ' +'           ���1          '+'����� ����');
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



procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
   N24Click(self);
   SpeedButton2Click(self);
end;

procedure TForm1.N18Click(Sender: TObject);
begin
   MessageDlg('GameJudge (TM) is under International copy-write laws.'+sLineBreak+
      '     All rights reserved for En. Michael Bidollahkhany'+sLineBreak+'Contact ' +
      'us for any suggestion: MichaelKhany@email.com',mtInformation,mbOKCancel,0);
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Case MessageDlg('�� ���� ���� ��� ����� �������� ����� ��ʡ ��� �� ���� ��� ' +
      '������Ͽ',mtWarning,mbOKCancel,0) of
     ID_OK:
     begin
       Action:= caFree;
       DeleteFile(ExtractFilePath(Application.ExeName)+'temp.txt');
     end;
     ID_CANCEL: Action :=caNone;

   end;
end;

procedure TForm1.RichEdit2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   Panel1.Hide;
end;

procedure TForm1.Edit1Click(Sender: TObject);
begin
   Edit1.SelectAll;
end;

procedure TForm1.N8Click(Sender: TObject);
var
  temp :string;
begin
   if PrintDialog1.Execute then
   begin
     temp :=ExtractFilePath(Application.ExeName);
     SaveStringGrid(StringGrid1,temp+'ResPrintTemp.tmp');
     RichEdit3.Clear;
     RichEdit3.Lines.LoadFromFile(UTF8Encode(temp+'ResPrintTemp.tmp'));
     RichEdit3.Print(PrintDialog1.GetNamePath);
     //MessageDlg('!������ ���� ��� (Error 013-Z)',mtError,mbOKCancel,0);
   end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
   N8Click(self);
end;

procedure TForm1.N12Click(Sender: TObject);
begin
   if PrintDialog1.Execute then
      RichEdit1.Print(PrintDialog1.GetNamePath);
end;

procedure TForm1.N14Click(Sender: TObject);
begin
    Refresh;
    RichEdit1.Refresh;
    RichEdit2.Refresh;
    StringGrid1.Refresh;
end;

end.

