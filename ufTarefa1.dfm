object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Tarefa 1'
  ClientHeight = 580
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbColunas: TLabel
    Left = 8
    Top = 45
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lbTabelas: TLabel
    Left = 224
    Top = 45
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lbCondicoes: TLabel
    Left = 440
    Top = 45
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lbSqlGerado: TLabel
    Left = 8
    Top = 354
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object mnTabelas: TMemo
    Left = 224
    Top = 64
    Width = 185
    Height = 257
    TabOrder = 1
  end
  object mnColunas: TMemo
    Left = 8
    Top = 64
    Width = 185
    Height = 257
    TabOrder = 0
  end
  object mnCondicoes: TMemo
    Left = 440
    Top = 64
    Width = 185
    Height = 257
    TabOrder = 2
  end
  object mnSqlGerado: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 373
    Width = 757
    Height = 204
    Align = alBottom
    ReadOnly = True
    TabOrder = 3
  end
  object Button1: TButton
    Left = 641
    Top = 168
    Width = 114
    Height = 41
    Caption = 'Gerar SQL'
    TabOrder = 4
    OnClick = Button1Click
  end
  object spQuery1: TspQuery
    Left = 672
    Top = 288
  end
end
