object fmMain: TfmMain
  Left = 0
  Top = 0
  Caption = 'Tarefas'
  ClientHeight = 558
  ClientWidth = 1100
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 64
    Top = 64
    object mnTarefa: TMenuItem
      Caption = 'Tarefa'
      object mnTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = mnTarefa1Click
      end
      object mnTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = mnTarefa2Click
      end
      object mnTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = mnTarefa3Click
      end
    end
  end
end
