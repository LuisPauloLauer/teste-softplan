inherited frmTarefa03: TfrmTarefa03
  Caption = 'Tarefa 03'
  DefaultMonitor = dmDesktop
  FormStyle = fsMDIChild
  Position = poDesktopCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 650
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object dbgRegistros: TDBGrid
    Left = 0
    Top = 0
    Width = 634
    Height = 289
    Align = alTop
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GroupBox1: TGroupBox
    Left = 473
    Top = 386
    Width = 153
    Height = 58
    Caption = 'Total Divis'#245'es R$:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object edTotalDiv: TMaskEdit
      Left = 16
      Top = 26
      Width = 117
      Height = 29
      TabOrder = 0
      Text = ''
    end
  end
  object GroupBox2: TGroupBox
    Left = 473
    Top = 311
    Width = 153
    Height = 58
    Caption = 'Total R$:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object edTotal: TMaskEdit
      Left = 16
      Top = 26
      Width = 115
      Height = 29
      TabOrder = 0
      Text = ''
    end
  end
  object Button1: TButton
    Left = 344
    Top = 320
    Width = 123
    Height = 49
    Caption = 'Obter Total'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 344
    Top = 395
    Width = 123
    Height = 49
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 5
    OnClick = Button2Click
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 232
    Top = 336
  end
end
