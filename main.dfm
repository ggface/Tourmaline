object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 516
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 496
    Width = 766
    Height = 20
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Port:'
        Width = 100
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'Status: CONTINUE_PENDING'
        Width = 150
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        Text = 'ST.: Port Mapping'
        Width = 100
      end>
    PaintStyle = stpsUseLookAndFeel
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 26
    Width = 766
    Height = 470
    Align = alClient
    TabOrder = 2
    object cxGrid1Level1: TcxGridLevel
      GridView = GV_PortForwarding
    end
  end
  object GVR: TcxGridViewRepository
    Left = 282
    Top = 120
    object GV_Users: TcxGridDBTableView
      OnCellDblClick = GV_UsersCellDblClick
      DataController.DataSource = dsUsers
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.FocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gvcUsersStatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'ENABLED'
        OnGetDisplayText = gvcUsersStatusGetDisplayText
        Options.Editing = False
        Options.Focusing = False
        Width = 97
      end
      object gvcUsersDisplayName: TcxGridDBColumn
        Caption = 'Display name'
        DataBinding.FieldName = 'N_USER'
        Options.Editing = False
        Options.Focusing = False
        Width = 200
      end
      object gvcUsersIP: TcxGridDBColumn
        Caption = 'IP'
        DataBinding.FieldName = 'IP_ADRESS'
        Options.Editing = False
        Options.Focusing = False
        Width = 143
      end
      object gvcUsersDescription: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'DESCRIPTION'
        Options.Editing = False
        Options.Focusing = False
        Width = 232
      end
    end
    object GV_BlackList: TcxGridDBTableView
      OnCellDblClick = GV_BlackListCellDblClick
      DataController.DataSource = dsBlackList
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.FocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object gvcBlacklistStatus: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'ENABLED'
        OnGetDisplayText = gvcBlacklistStatusGetDisplayText
        Options.Editing = False
        Options.Focusing = False
        Width = 66
      end
      object gvcBlacklistURL: TcxGridDBColumn
        DataBinding.FieldName = 'URL'
        Options.Editing = False
        Options.Focusing = False
        Width = 417
      end
      object gvcBlacklistDescription: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'DESCRIPTION'
        Options.Editing = False
        Options.Focusing = False
        Width = 189
      end
    end
    object GV_PortForwarding: TcxGridDBTableView
      OnCellDblClick = GV_PortForwardingCellDblClick
      DataController.DataSource = dsMaplist
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.FocusRect = False
      OptionsView.ColumnAutoWidth = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object GV_PortForwardingColumn1: TcxGridDBColumn
        Caption = 'Status'
        DataBinding.FieldName = 'ENABLED'
        OnGetDisplayText = GV_PortForwardingColumn1GetDisplayText
        Options.Editing = False
        Options.Focusing = False
        Width = 95
      end
      object GV_PortForwardingColumn2: TcxGridDBColumn
        Caption = 'Local port'
        DataBinding.FieldName = 'LOCAL_PORT'
        Options.Editing = False
        Options.Focusing = False
        Width = 145
      end
      object GV_PortForwardingColumn3: TcxGridDBColumn
        Caption = 'Remote port'
        DataBinding.FieldName = 'REMOTE_PORT'
        Options.Editing = False
        Options.Focusing = False
        Width = 144
      end
      object GV_PortForwardingColumn4: TcxGridDBColumn
        Caption = 'Remote IP'
        DataBinding.FieldName = 'REMOTEIP'
        Options.Editing = False
        Options.Focusing = False
        Width = 144
      end
      object GV_PortForwardingColumn5: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'DESCRIPTION'
        Options.Editing = False
        Options.Focusing = False
        Width = 144
      end
    end
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    CanCustomize = False
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    Style = bmsUseLookAndFeel
    UseSystemFont = True
    Left = 152
    Top = 120
    DockControlHeights = (
      0
      0
      26
      0)
    object dxBarManager1Bar1: TdxBar
      AllowQuickCustomizing = False
      Caption = 'Main'
      CaptionButtons = <>
      DockedDockingStyle = dsTop
      DockedLeft = 0
      DockedTop = 0
      DockingStyle = dsTop
      FloatLeft = 240
      FloatTop = 123
      FloatClientWidth = 51
      FloatClientHeight = 22
      IsMainMenu = True
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarSubItem1'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem3'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarSubItem2'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem4'
        end
        item
          Visible = True
          ItemName = 'dxBarSubItem5'
        end
        item
          Visible = True
          ItemName = 'dxBarButton8'
        end>
      MultiLine = True
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object dxBarSubItem1: TdxBarSubItem
      Caption = 'System'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton16'
        end
        item
          Visible = True
          ItemName = 'dxBarButton1'
        end
        item
          Visible = True
          ItemName = 'dxBarButton2'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton22'
        end
        item
          Visible = True
          ItemName = 'dxBarButton20'
        end
        item
          Visible = True
          ItemName = 'dxBarButton21'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'dxBarButton14'
        end>
    end
    object dxBarButton1: TdxBarButton
      Caption = 'Start'
      Category = 0
      Hint = 'Start'
      Visible = ivAlways
      OnClick = dxBarButton1Click
    end
    object dxBarButton2: TdxBarButton
      Caption = 'Stop'
      Category = 0
      Hint = 'Stop'
      Visible = ivAlways
      OnClick = dxBarButton2Click
    end
    object dxBarButton4: TdxBarButton
      Caption = 'Userlist'
      Category = 0
      Hint = 'Userlist'
      Visible = ivAlways
      OnClick = dxBarButton4Click
    end
    object dxBarSubItem2: TdxBarSubItem
      Caption = 'User'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton6'
        end
        item
          Visible = True
          ItemName = 'dxBarButton5'
        end
        item
          Visible = True
          ItemName = 'dxBarButton7'
        end>
    end
    object dxBarButton6: TdxBarButton
      Caption = 'New'
      Category = 0
      Hint = 'New'
      Visible = ivAlways
      OnClick = dxBarButton6Click
    end
    object dxBarButton5: TdxBarButton
      Caption = 'Edit'
      Category = 0
      Hint = 'Edit'
      Visible = ivAlways
      OnClick = dxBarButton5Click
    end
    object dxBarButton7: TdxBarButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Visible = ivAlways
      OnClick = dxBarButton7Click
    end
    object dxBarSubItem3: TdxBarSubItem
      Caption = 'Browse'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton4'
        end
        item
          Visible = True
          ItemName = 'dxBarButton9'
        end
        item
          Visible = True
          ItemName = 'dxBarButton15'
        end>
    end
    object dxBarButton8: TdxBarButton
      Caption = 'About'
      Category = 0
      Hint = 'About'
      Visible = ivAlways
      OnClick = dxBarButton8Click
    end
    object dxBarButton9: TdxBarButton
      Caption = 'Blacklist'
      Category = 0
      Hint = 'Blacklist'
      Visible = ivAlways
      OnClick = dxBarButton9Click
    end
    object dxBarSubItem4: TdxBarSubItem
      Caption = 'Blacklist'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton10'
        end
        item
          Visible = True
          ItemName = 'dxBarButton11'
        end
        item
          Visible = True
          ItemName = 'dxBarButton12'
        end>
    end
    object dxBarButton10: TdxBarButton
      Caption = 'New'
      Category = 0
      Hint = 'New'
      Visible = ivAlways
      OnClick = dxBarButton10Click
    end
    object dxBarButton11: TdxBarButton
      Caption = 'Edit'
      Category = 0
      Hint = 'Edit'
      Visible = ivAlways
      OnClick = dxBarButton11Click
    end
    object dxBarButton12: TdxBarButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Visible = ivAlways
      OnClick = dxBarButton12Click
    end
    object dxBarButton14: TdxBarButton
      Caption = 'Exit'
      Category = 0
      Hint = 'Exit'
      Visible = ivAlways
      OnClick = dxBarButton14Click
    end
    object dxBarButton15: TdxBarButton
      Caption = 'Port Mapping'
      Category = 0
      Hint = 'Port Mapping'
      Visible = ivAlways
      OnClick = dxBarButton15Click
    end
    object dxBarButton16: TdxBarButton
      Caption = 'Restart'
      Category = 0
      Hint = 'Restart'
      Visible = ivAlways
      OnClick = dxBarButton16Click
    end
    object dxBarSubItem5: TdxBarSubItem
      Caption = 'Port Mapping'
      Category = 0
      Visible = ivAlways
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarButton17'
        end
        item
          Visible = True
          ItemName = 'dxBarButton18'
        end
        item
          Visible = True
          ItemName = 'dxBarButton19'
        end>
    end
    object dxBarButton17: TdxBarButton
      Caption = 'New'
      Category = 0
      Hint = 'New'
      Visible = ivAlways
      OnClick = dxBarButton17Click
    end
    object dxBarButton18: TdxBarButton
      Caption = 'Edit'
      Category = 0
      Hint = 'Edit'
      Visible = ivAlways
      OnClick = dxBarButton18Click
    end
    object dxBarButton19: TdxBarButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Visible = ivAlways
      OnClick = dxBarButton19Click
    end
    object dxBarButton20: TdxBarButton
      Caption = 'Install service'
      Category = 0
      Hint = 'Install service'
      Visible = ivAlways
      OnClick = dxBarButton20Click
    end
    object dxBarButton21: TdxBarButton
      Caption = 'Uninstall service'
      Category = 0
      Hint = 'Uninstall service'
      Visible = ivAlways
      OnClick = dxBarButton21Click
    end
    object dxBarButton22: TdxBarButton
      Caption = 'Hot restart'
      Category = 0
      Hint = 'Hot restart'
      Visible = ivAlways
      OnClick = dxBarButton22Click
    end
  end
  object Userlist_Cell_PM: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton6'
      end
      item
        Visible = True
        ItemName = 'dxBarButton5'
      end
      item
        Visible = True
        ItemName = 'dxBarButton7'
      end>
    UseOwnFont = False
    Left = 280
    Top = 328
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGrid1
    PopupMenus = <
      item
        GridView = GV_Users
        HitTypes = [gvhtCell]
        Index = 0
        PopupMenu = Userlist_Cell_PM
      end
      item
        GridView = GV_Users
        HitTypes = [gvhtNone]
        Index = 1
        PopupMenu = Userlist_None_PM
      end
      item
        GridView = GV_BlackList
        HitTypes = [gvhtCell]
        Index = 2
        PopupMenu = Blacklist_Cell_PM
      end
      item
        GridView = GV_BlackList
        HitTypes = [gvhtNone]
        Index = 3
        PopupMenu = Blacklist_None_PM
      end
      item
        GridView = GV_PortForwarding
        HitTypes = [gvhtCell]
        Index = 4
        PopupMenu = PortMapping_Cell_PM
      end
      item
        GridView = GV_PortForwarding
        HitTypes = [gvhtNone]
        Index = 5
        PopupMenu = PortMapping_None_PM
      end>
    Left = 280
    Top = 168
  end
  object Userlist_None_PM: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton6'
      end>
    UseOwnFont = False
    Left = 152
    Top = 328
  end
  object Blacklist_Cell_PM: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton10'
      end
      item
        Visible = True
        ItemName = 'dxBarButton11'
      end
      item
        Visible = True
        ItemName = 'dxBarButton12'
      end>
    UseOwnFont = False
    Left = 280
    Top = 280
  end
  object Blacklist_None_PM: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton10'
      end>
    UseOwnFont = False
    Left = 152
    Top = 280
  end
  object glRegistry1: TglRegistry
    CompanyName = 'Icarus.Empire'
    ProjectName = 'Tourmaline'
    Left = 152
    Top = 72
  end
  object Timer1: TTimer
    Interval = 3000
    OnTimer = Timer1Timer
    Left = 400
    Top = 72
  end
  object PortMapping_None_PM: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton17'
      end>
    UseOwnFont = False
    Left = 152
    Top = 376
  end
  object PortMapping_Cell_PM: TdxBarPopupMenu
    BarManager = dxBarManager1
    ItemLinks = <
      item
        Visible = True
        ItemName = 'dxBarButton17'
      end
      item
        Visible = True
        ItemName = 'dxBarButton18'
      end
      item
        Visible = True
        ItemName = 'dxBarButton19'
      end>
    UseOwnFont = False
    Left = 280
    Top = 376
  end
  object PopupMenu1: TPopupMenu
    Left = 400
    Top = 168
    object Restore1: TMenuItem
      Caption = 'Restore'
      OnClick = Restore1Click
    end
    object Hide1: TMenuItem
      Caption = 'Hide'
      OnClick = Hide1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Exit1: TMenuItem
      Caption = 'Exit'
      OnClick = Exit1Click
    end
  end
  object CoolTrayIcon1: TCoolTrayIcon
    CycleInterval = 0
    Hint = 'Tourmaline'
    Icon.Data = {
      0000010001002020200000000000A81000001600000028000000200000004000
      0000010020000000000000100000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0002000000060000000B0000000D0000000D0000000D0000000D0000000D0000
      000D0000000D0000000D0000000D0000000D0000000D0000000D0000000D0000
      000D0000000D0000000D0000000D0000000D0000000D0000000D0000000D0000
      000D0000000D0000000D0000000D0000000D0000000B00000006000000020000
      0006000000160000002300000026000000260000002600000026000000260000
      0026000000260000002600000026000000260000002600000026000000260000
      0026000000260000002600000026000000260000002600000026000000260000
      0026000000260000002600000026000000260000002300000016000000068B86
      848185817EF7888481FF888481FF888481FF888481FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF888481FF888481FF888481FF8A86
      83FF8C8986FF8F8C89FF8F8A87FF8B8785FF888482FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF79757394000000230000000B8884
      81FFF7F2EFFFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F2EFFFFCFCFCFFF9FDFFFFF4F8FAFFFAFFFFFFF7FCFFFFF5F9FCFFF5F9
      FBFFF8FDFFFFFEFFFFFFFDFFFFFFFCFFFFFFFAFFFFFFF9FFFFFFF6FBFEFFF5F6
      F6FFF6F7F8FFF6F7F8FFF6F6F7FFF4F5F4FFF2F3F3FFF1F2F2FFF0F1F0FFF0F1
      F1FFF0F1F1FFF0F1F1FFF1F2F3FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F3F1FFFBF9F6FFFAFBFCFFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6
      E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFE6E6E7FFF2F3
      F5FFF6F7F8FFF7F8F9FFF6F7F8FFF5F6F7FFF3F4F4FFF2F3F2FFF0F0F0FFEDEE
      EEFFECECECFFECECECFFEDEDEEFFFBF9F6FF888481FF000000260000000D8884
      81FFF8F6F5FFFBF9F6FFAEA3A2FFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BD
      BCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFADA1A0FFE6E6E7FFF4F5
      F7FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF4F4F5FFF1F2
      F3FFEEEEEEFFEDEDEDFFEDEDEEFFFBF9F6FF888481FF000000260000000D8884
      81FFF7F6F3FFFBF9F6FFD1BDBCFF84A057FF82A259FF80A55AFF7EA75CFF7BA9
      5EFF79AB60FF77AD62FF75AF63FF73B165FF71B366FFD1BDBCFFE6E6E7FFF2F6
      F8FFF6F7F8FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF6F7F8FFF4F5
      F5FFEFF0F1FFEDEDEDFFEDEEEEFFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF879C54FF859F56FF83A158FF81A45AFF7FA6
      5CFF7CA85DFF7AAB5FFF78AD61FF76AF63FF74B164FFD1BDBCFFE6E6E7FFF3F6
      F8FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F7F8FFF4F6
      F6FFF0F1F1FFEFEFEFFFEEEFF0FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF8A9852FF889B53FF869E55FF84A057FF82A3
      59FF7FA55BFF7DA75DFF7BAA5FFF79AC60FF76AE62FFD1BDBCFFE6E6E7FFF4F6
      F7FFF5F6F7FFF6F7F8FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF6F7F8FFF5F6
      F6FFF2F2F2FFF0F0F0FFEFF0F1FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF8C9550FF8B9751FF899A53FF879C55FF859F
      56FF83A258FF80A45AFF7EA65CFF7CA95EFF79AB60FFD1BDBCFFE6E6E7FFF4F7
      F9FFF6F7F9FFF7F8F8FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF8F904DFF8D934FFF8B9651FF8A9952FF889B
      54FF869E56FF84A157FF81A359FF7FA55BFF7DA85DFFD1BDBCFFE6E6E7FFF4F7
      F9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F5F3FFFBF9F6FFD1BDBCFF918C4BFF908F4DFF8E924EFF8C9550FF8A98
      51FF899A53FF879D55FF84A057FF82A259FF80A55AFFD1BDBCFFE6E6E7FFF4F5
      F9FFF8F9FAFFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF6F5F3FFFBF9F6FFD1BDBCFF948749FF928A4AFF908E4CFF8F914EFF8D94
      4FFF8B9751FF899952FF879C54FF859F56FF83A158FFD1BDBCFFE6E6E7FFF4F6
      F9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FF6EB669FF6EB669FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF6F4F3FFFBF9F6FFD1BDBCFF968247FF948648FF93894AFF918D4BFF8F90
      4DFF8E934FFF8C9650FF8A9852FF889B53FF869E55FFD1BDBCFFE6E6E7FFF4F7
      FAFFF8F8F8FFF5F6F7FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FF6EB669FF6EB669FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF6F4F2FFFBF9F6FFD1BDBCFFB29E73FF99854CFF958447FF938849FF928B
      4BFF908E4CFF8E924EFF8C9550FF8B9751FF899A53FFD1BDBCFFE6E6E7FFF3F6
      FAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FF80A55BFF6EB669FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF6F4F2FFFBF9F6FFD1BDBCFFBCA682FFB9A57FFFA89464FF9B884FFF9486
      48FF928A4AFF918D4CFF8F904DFF8D934FFF8B9651FFD1BDBCFFE6E6E7FFF4F6
      FAFFF7F8F9FFF6F7F8FFF7F8F8FFF6F7F8FFF6F7F8FFF7F8F9FFF7F8F9FFF7F8
      F9FF8B9751FF80A55BFFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFF7F6F4FFFBF9F6FFD1BDBCFFB99D78FFB89F7AFFB7A17AFFB6A47CFFB09F
      72FFAB9F6FFFA69D69FF9F9B63FF9D9C62FF9CA064FFD1BDBCFFE6E6E7FFF5F6
      FAFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FF958347FF8B9751FFF7F8F9FFFBF9F6FF888481FF000000260000000D8884
      81FFFCFCFDFFFBF9F6FFD1BDBCFFB5936EFFB4956EFFB3976FFFB39A71FFB19C
      71FFB09F73FFAFA174FFAEA475FFADA676FFABA978FFD1BDBCFFE6E6E7FFF4F7
      FAFFF7F8F9FFF6F8F8FFF7F8F9FFF6F7F8FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFA06A3CFF958347FFF7F8F9FFFBF9F6FF888481FF000000260000000D8A86
      84F6FCFCFCFFFBF9F6FFD1BDBCFFB18861FFB08A62FFAF8B62FFAE8E64FFAD91
      65FFAC9366FFAA9667FFA99969FFA89C6AFFA79F6BFFD1BDBCFFE6E6E7FFF4F7
      F9FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FFA06A3CFFA06A3CFFF7F8F9FFFBF9F6FF888481FF000000260000000D8A86
      84F6FCFCFCFFFBF9F6FFD1BDBCFFAC7D54FFAB7E55FFAA8056FFA98257FFA885
      58FFA88759FFA68B5BFFA58D5BFFA3915DFFA2935EFFD1BDBCFFE6E6E7FFF5F7
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFA06A3CFFA06A3CFFF7F8F9FFFBF9F6FF888481FF000000260000000D8A86
      84F6FCFCFBFFFBF9F6FFC6BABAFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BD
      BCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFD1BDBCFFC6BBBAFFFAFBFCFFFAFB
      FCFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFF7F8F9FFF7F8
      F9FFA06A3CFFA06A3CFFF7F8F9FFFBF9F6FF888481FF000000260000000D8A86
      84F6FBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9
      F6FFFBF9F6FFFBF9F6FFFBF9F6FFFBF9F6FF888481FF000000260000000D8B86
      84F6F7F5F3FFF8F9FAFFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF7F8F9FFF8F8
      F9FFF7F8F9FFF7F8F8FFF7F8F8FFF7F8F8FFF7F8F8FFF7F8F8FFF7F8F9FFF7F8
      F9FFF7F8F9FFF7F8F9FFF8F9FAFFFBF9F6FF888481FF000000260000000D8E8A
      88F6CBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9
      C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9
      C7FFCCCAC9FFCDCBCAFFCDCCCAFFCDCCCAFFCDCBC9FFCCCAC8FFCCCAC8FFCBC9
      C7FFCBC9C7FFCBC9C7FFCBC9C7FFCBC9C7FF888481FF000000230000000B8B89
      87FEE6DED8FFDFD7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7
      D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7
      D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FFDED7D1FF917968FFDED7
      D1FF917968FFDED7D1FF917968FFDED7D1FF888481FF0000001600000006918C
      897C888481FF888481FF888481FF888481FF888481FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF888481FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF888481FF888481FF888481FF8884
      81FF888481FF888481FF888481FF888481FF8B86848100000006000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF}
    IconVisible = True
    IconIndex = 0
    PopupMenu = PopupMenu1
    MinimizeToTray = True
    OnDblClick = CoolTrayIcon1DblClick
    OnMinimizeToTray = CoolTrayIcon1MinimizeToTray
    Left = 280
    Top = 72
  end
  object Skin: TdxSkinController
    SkinName = 'Darkroom'
    Left = 152
    Top = 168
  end
  object glTools1: TglTools
    Left = 400
    Top = 120
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.tdb'
    Left = 502
    Top = 72
  end
  object dsUsers: TDataSource
    Left = 522
    Top = 214
  end
  object dsMaplist: TDataSource
    Left = 522
    Top = 262
  end
  object dsBlackList: TDataSource
    Left = 522
    Top = 312
  end
end
