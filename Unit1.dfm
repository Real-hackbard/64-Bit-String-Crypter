object Form1: TForm1
  Left = 476
  Top = 157
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '64 Bit String Crypter'
  ClientHeight = 479
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Memo1: TMemo
    Left = 7
    Top = 7
    Width = 434
    Height = 306
    TabStop = False
    Lines.Strings = (
      'Created for security researchers, enthusiasts and educators, '
      
        'Crypter allows you to experience ransomware first hand. The newl' +
        'y '
      
        'released v3.0 is a complete overhaul that drastically simplifies' +
        ' '
      'setup and brings the package up-to-date to work with Python 3.6 '
      'and above.'
      ''
      
        'If you'#39're looking to dive straight in then head to the section o' +
        'n '
      'Getting Started. Otherwise continue reading to learn more about '
      'Crypter.'
      ''
      'Crypter is intended for educational and research purposes only. '
      
        'This software should not be used within any system or network fo' +
        'r '
      'which you do not have permission, nor should it be used for any '
      
        'illegal or illicit purposes. The author takes no responsibility ' +
        'for any '
      'damages that may be caused by the software in this repository.'
      ''
      
        'Once compiled, Crypter WILL encrypt the files on the computer on' +
        ' '
      
        'which it is executed. Whilst Crypter provides you with access to' +
        ' '
      
        'the decryption key, enabling you to decrypt any encrypted files,' +
        ' '
      'bugs and other issues could, in theory, interrupt or prevent a '
      
        'successful decryption. Consequently, a permanent and irreversibl' +
        'e '
      'loss of data could occur. To avoid any potential damage, you '
      
        'should only run Crypter on a test machine created for this purpo' +
        'se.'
      ''
      'Once again,the author accepts no responsibility for any damages '
      'that may occur, and by downloading this software you accept and '
      'agree to this disclaimer.')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 269
    Top = 430
    Width = 82
    Height = 20
    Caption = 'Crypt'
    TabOrder = 1
    TabStop = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 358
    Top = 430
    Width = 81
    Height = 20
    Caption = 'Decrypt'
    TabOrder = 2
    TabStop = False
    OnClick = Button2Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 460
    Width = 448
    Height = 19
    Panels = <
      item
        Text = 'Line :'
        Width = 50
      end
      item
        Width = 50
      end>
    ExplicitTop = 252
    ExplicitWidth = 350
  end
  object RadioGroup1: TRadioGroup
    Left = 7
    Top = 319
    Width = 434
    Height = 105
    Caption = ' Unicode '
    Columns = 2
    ItemIndex = 7
    Items.Strings = (
      'ASCii'
      'ANSI'
      'UTF-7'
      'UTF-8'
      'UTF-16 BE'
      'UTF-16 LE'
      'UTF-8 Boom'
      'Default')
    TabOrder = 4
  end
  object Button3: TButton
    Left = 89
    Top = 430
    Width = 75
    Height = 20
    Caption = 'Clear'
    TabOrder = 5
    TabStop = False
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 8
    Top = 430
    Width = 75
    Height = 20
    Caption = 'Text'
    TabOrder = 6
    TabStop = False
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Left = 56
    Top = 40
  end
end
