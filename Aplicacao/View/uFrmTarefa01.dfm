inherited frmTarefa01: TfrmTarefa01
  Caption = 'Tarefa 01'
  ClientWidth = 665
  DefaultMonitor = dmDesktop
  FormStyle = fsMDIChild
  Position = poDesktopCenter
  PrintScale = poNone
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 681
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 16
    Top = 293
    Width = 87
    Height = 21
    Caption = 'SQL gerado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [1]
    Left = 447
    Top = 29
    Width = 79
    Height = 21
    Caption = 'Condi'#231#245'es'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [2]
    Left = 232
    Top = 29
    Width = 57
    Height = 21
    Caption = 'Tabelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel [3]
    Left = 16
    Top = 29
    Width = 61
    Height = 21
    Caption = 'Colunas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlRodapePadrao: TPanel
    Width = 665
    ExplicitWidth = 665
    inherited stbRodapePadrao: TStatusBar
      Width = 665
      ExplicitWidth = 665
    end
    object btnGerarSql: TButton
      Left = 16
      Top = 8
      Width = 225
      Height = 48
      Caption = 'Gerar SQL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnGerarSqlClick
    end
  end
  object tmSQLGerado: TMemo
    Left = 16
    Top = 320
    Width = 632
    Height = 129
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object tmCondicoes: TMemo
    Left = 447
    Top = 56
    Width = 201
    Height = 233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object tmTabela: TMemo
    Left = 232
    Top = 56
    Width = 201
    Height = 233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object tmColunas: TMemo
    Left = 16
    Top = 56
    Width = 201
    Height = 233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object spQGeraSql: TspQuery
    SQL.Strings = (
      'SELECT'
      '/*COLUNAS*/'
      'FROM'
      '/*TABELA*/'
      'WHERE'
      '/*CONDICOES*/')
    Left = 264
    Top = 477
  end
end
