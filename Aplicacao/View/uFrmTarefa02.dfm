inherited frmTarefa02: TfrmTarefa02
  Caption = 'Tarefa 02'
  ClientHeight = 309
  ClientWidth = 628
  DefaultMonitor = dmDesktop
  FormStyle = fsMDIChild
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 644
  ExplicitHeight = 348
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRodapePadrao: TPanel
    Top = 217
    Width = 628
    ExplicitTop = 217
    ExplicitWidth = 628
    inherited stbRodapePadrao: TStatusBar
      Width = 628
      ExplicitWidth = 628
    end
  end
  object btIniciar: TButton
    Left = 336
    Top = 28
    Width = 129
    Height = 80
    Caption = '&Iniciar'
    TabOrder = 1
    OnClick = btIniciarClick
  end
  object gpbIntervaloTemp: TGroupBox
    Left = 136
    Top = 28
    Width = 185
    Height = 80
    Caption = ' Intervalo de tempo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object edIntervalo: TEdit
      Left = 3
      Top = 31
      Width = 179
      Height = 29
      Alignment = taRightJustify
      TabOrder = 0
      Text = '0'
    end
  end
  object pgbContagem: TProgressBar
    Left = 0
    Top = 173
    Width = 628
    Height = 44
    Align = alBottom
    TabOrder = 3
  end
end
