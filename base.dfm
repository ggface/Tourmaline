object Bases: TBases
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 254
  Width = 306
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXDataSnap'
      'HostName=localhost'
      'Port=6589'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=15.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}')
    Left = 48
    Top = 8
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TTourmaline'
    SQLConnection = SQLConnection1
    Left = 200
    Top = 8
  end
  object cdsPORTFORWARDING: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspPORTFORWARDING'
    RemoteServer = DSProviderConnection1
    Left = 48
    Top = 56
    object cdsPORTFORWARDINGLOCALPORT: TIntegerField
      FieldName = 'LOCALPORT'
    end
    object cdsPORTFORWARDINGREMOTEPORT: TIntegerField
      FieldName = 'REMOTEPORT'
    end
    object cdsPORTFORWARDINGREMOTEIP: TStringField
      FieldName = 'REMOTEIP'
      Size = 15
    end
    object cdsPORTFORWARDINGDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object cdsPORTFORWARDINGACTIVE: TSmallintField
      FieldName = 'ACTIVE'
    end
  end
  object dsPORTFORWARDING: TDataSource
    DataSet = cdsPORTFORWARDING
    Left = 200
    Top = 56
  end
  object cdsBLACKLIST: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspBLACKLIST'
    RemoteServer = DSProviderConnection1
    Left = 48
    Top = 104
    object cdsBLACKLISTURL: TStringField
      FieldName = 'URL'
      Required = True
      Size = 600
    end
    object cdsBLACKLISTDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object cdsBLACKLISTACTIVE: TSmallintField
      FieldName = 'ACTIVE'
      Required = True
    end
  end
  object cdsUSERS: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspUSERS'
    RemoteServer = DSProviderConnection1
    Left = 48
    Top = 152
    object cdsUSERSUSERNAME: TStringField
      FieldName = 'USERNAME'
      Required = True
      Size = 50
    end
    object cdsUSERSFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object cdsUSERSLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object cdsUSERSDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object cdsUSERSADRESSIP: TStringField
      FieldName = 'ADRESSIP'
      Size = 15
    end
    object cdsUSERSACTIVE: TSmallintField
      FieldName = 'ACTIVE'
      Required = True
    end
  end
  object dsBLACKLIST: TDataSource
    DataSet = cdsBLACKLIST
    Left = 200
    Top = 104
  end
  object dsUSERS: TDataSource
    DataSet = cdsUSERS
    Left = 200
    Top = 152
  end
  object glTools1: TglTools
    Left = 48
    Top = 200
  end
end
