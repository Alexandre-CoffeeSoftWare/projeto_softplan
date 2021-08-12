object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Tarefa 3'
  ClientHeight = 363
  ClientWidth = 604
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTotal: TLabel
    Left = 475
    Top = 279
    Width = 44
    Height = 13
    Caption = 'Total R$:'
  end
  object Label2: TLabel
    Left = 475
    Top = 322
    Width = 81
    Height = 13
    Caption = 'Total Divis'#227'o R$:'
  end
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 598
    Height = 16
    Align = alTop
    Caption = 'Valores por projeto:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 116
  end
  object gridDados: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 25
    Width = 598
    Height = 248
    Align = alTop
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idProduto'
        ReadOnly = True
        Title.Caption = 'ID Projeto'
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProjeto'
        ReadOnly = True
        Title.Caption = 'Nome Projeto'
        Width = 390
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        ReadOnly = True
        Width = 100
        Visible = True
      end>
  end
  object edtTotal: TEdit
    Left = 475
    Top = 295
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = '0,00'
  end
  object btnObterTotal: TButton
    Left = 339
    Top = 283
    Width = 108
    Height = 33
    Caption = 'Obter Total'
    TabOrder = 2
    OnClick = btnObterTotalClick
  end
  object edtTotalDivisoes: TEdit
    Left = 475
    Top = 335
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 3
    Text = '0,00'
  end
  object btnObterDivisao: TButton
    Left = 307
    Top = 323
    Width = 140
    Height = 33
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 4
    OnClick = btnObterDivisaoClick
  end
end
