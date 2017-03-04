unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.TabNotBk, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Themes, Vcl.Styles, VCLTee.TeCanvas, Vcl.Samples.Spin;

type
  TForm2 = class(TForm)
    FontDialog1: TFontDialog;
    TabbedNotebook1: TTabbedNotebook;
    Memo1: TMemo;
    Button1: TButton;
    Bevel1: TBevel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    ButtonColor1: TButtonColor;
    ButtonedEdit1: TButtonedEdit;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonedEdit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Unit1;

procedure TForm2.Button1Click(Sender: TObject);
begin
   Close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
   form1.Enabled :=true;
   if ComboBox1.ItemIndex = 0 then
      TStyleManager.TrySetStyle('Aqua Light Slate')
   else
      TStyleManager.TrySetStyle('Charcoal Dark Slate');

    if CheckBox1.Checked then
    begin
      Form1.Font :=FontDialog1.Font;
      Form1.Font.Size :=SpinEdit1.Value;
      Form1.Font.Color :=ButtonColor1.SymbolColor;
    end
    else
    begin
      Form1.StringGrid1.Font :=FontDialog1.Font;
      Form1.CheckListBox1.Font :=FontDialog1.Font;
      Form1.StringGrid1.Font.Size:=SpinEdit1.Value;
      Form1.CheckListBox1.Font.Size:=SpinEdit1.Value;
      Form1.StringGrid1.Font.Color:=ButtonColor1.SymbolColor;
      Form1.CheckListBox1.Font.Color:=ButtonColor1.SymbolColor;
    end;

      form1.Refresh;
   //Form1.Enabled :=false;
end;

procedure TForm2.ButtonedEdit1Click(Sender: TObject);
begin
   if FontDialog1.Execute then
   begin
      ButtonedEdit1.Text :=FontDialog1.Font.Name;
      SpinEdit1.Value :=FontDialog1.Font.Size;
      ButtonColor1.SymbolColor :=FontDialog1.Font.Color;
   end;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  form1.Enabled :=true;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
   form1.Enabled :=false;
end;

end.
