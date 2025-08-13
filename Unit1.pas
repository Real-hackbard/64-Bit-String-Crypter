unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, XPMan, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    StatusBar1: TStatusBar;
    RadioGroup1: TRadioGroup;
    Button3: TButton;
    Button4: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
function EncodeBase64(Value: String): String;
const
 b64alphabet: PChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  pad: PChar = '====';

  function EncodeChunk(const Chunk: String): String;
  var
    W: LongWord;
    i, n: Byte;
  begin
    n := Length(Chunk); W := 0;
    for i := 0 to n - 1 do
      W := W + Ord(Chunk[i + 1]) shl ((2 - i) * 8);
    Result := b64alphabet[(W shr 18) and $3f] +
              b64alphabet[(W shr 12) and $3f] +
              b64alphabet[(W shr 06) and $3f] +
              b64alphabet[(W shr 00) and $3f];
    if n <> 3 then
      Result := Copy(Result, 0, n + 1) + Copy(pad, 0, 3 - n);   //add padding when out len isn't 24 bits
  end;

begin
  Result := '';
  while Length(Value) > 0 do
  begin
    Result := Result + EncodeChunk(Copy(Value, 0, 3));
    Delete(Value, 1, 3);
  end;
end;

function DecodeBase64(Value: String): String;
const b64alphabet: PChar = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
  function DecodeChunk(const Chunk: String): String;
  var
    W: LongWord;
    i: Byte;
  begin
    W := 0; Result := '';
    for i := 1 to 4 do
      if Pos(Chunk[i], b64alphabet) <> 0 then
        W := W + Word((Pos(Chunk[i], b64alphabet) - 1)) shl ((4 - i) * 6);
    for i := 1 to 3 do
      Result := Result + Chr(W shr ((3 - i) * 8) and $ff);
  end;
begin
  Result := '';
  if Length(Value) mod 4 <> 0 then Exit;
  while Length(Value) > 0 do
  begin
    Result := Result + DecodeChunk(Copy(Value, 0, 4));
    Delete(Value, 1, 4);
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
const
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);

var
  text : TStringList;
  UTF8Str: UTF8String;
  FS: TFileStream;
begin
  try
      text := TStringList.Create;
      text.Text := (Memo1.Text);

      case RadioGroup1.ItemIndex of
      0 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.ASCII);
      1 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.ANSI);
      2 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.UTF7);
      3 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.UTF8);
      4 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.BigEndianUnicode);
      5 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.Unicode);
      6 : begin
            UTF8Str := UTF8Encode(Memo1.Text);
            FS := TFileStream.Create(ExtractFilePath(Application.ExeName) + 'text.txt', fmCreate);
            try
              FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
              FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
            finally
            FS.Free;
          end;
          end;
      7 : text.SaveToFile(ExtractFilePath(Application.ExeName) + 'text.txt', TEncoding.Default);
      end;

      Memo1.Clear;
      Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) + 'text.txt');
    finally
    text.Free;
    end;


  Memo1.Text := EncodeBase64(Memo1.Text);
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Text := DecodeBase64(Memo1.Text);
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
  StatusBar1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Memo1.Clear;
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
  Memo1.Clear;
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := IntToStr(Memo1.Lines.Count);
end;

end.
