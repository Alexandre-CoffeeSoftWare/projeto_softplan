object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Tarefa 2'
  ClientHeight = 360
  ClientWidth = 587
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
  object pnEvento: TPanel
    Left = 40
    Top = 40
    Width = 505
    Height = 281
    TabOrder = 0
    object prog2: TProgressBar
      Left = 32
      Top = 231
      Width = 433
      Height = 17
      TabOrder = 0
    end
    object btnIniciaContagem: TButton
      Left = 32
      Top = 57
      Width = 145
      Height = 57
      Caption = 'Iniciar contagem'
      TabOrder = 1
      OnClick = btnIniciaContagemClick
    end
    object prog1: TProgressBar
      Left = 32
      Top = 207
      Width = 433
      Height = 17
      TabOrder = 2
    end
    object pnConfig: TPanel
      Left = 280
      Top = 24
      Width = 185
      Height = 121
      BevelInner = bvLowered
      TabOrder = 3
      object lbTempo1: TLabel
        Left = 24
        Top = 20
        Width = 121
        Height = 13
        Caption = 'Tempo de espera barra 1'
      end
      object lbTempo2: TLabel
        Left = 24
        Top = 67
        Width = 121
        Height = 13
        Caption = 'Tempo de espera barra 2'
      end
      object lbMili1: TLabel
        Left = 111
        Top = 38
        Width = 60
        Height = 13
        Caption = 'Milisegundos'
      end
      object Label1: TLabel
        Left = 111
        Top = 86
        Width = 60
        Height = 13
        Caption = 'Milisegundos'
      end
      object edtTempo1: TEdit
        Left = 23
        Top = 35
        Width = 82
        Height = 21
        NumbersOnly = True
        TabOrder = 0
        Text = '0'
      end
      object edtTempo2: TEdit
        Left = 23
        Top = 83
        Width = 82
        Height = 21
        NumbersOnly = True
        TabOrder = 1
        Text = '0'
      end
    end
  end
end
