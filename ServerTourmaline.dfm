object Tourmaline: TTourmaline
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 269
  Width = 424
  object Tourmaline: TSQLConnection
    ConnectionName = 'Tourmaline'
    DriverName = 'FIREBIRD'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver150.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=15.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver150.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=15.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'VendorLib=fbclient.DLL'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'ErrorResourceFile='
      'ServerCharSet='
      'drivername=FIREBIRD'
      'blobsize=-1'
      'commitretain=False'
      'Database=C:\Users\vpupkin\Dropbox\Dev\Tourmaline\TOURMALINE.FDB'
      'localecode=0000'
      'Password=a1l9e8n7'
      'rolename=RoleName'
      'sqldialect=3'
      'isolationlevel=ReadCommitted'
      'user_name=sysdba'
      'waitonlocks=True'
      'trim char=False')
    VendorLib = 'fbclient.DLL'
    Connected = True
    Left = 24
    Top = 8
  end
  object PORTFORWARDING: TSQLDataSet
    Active = True
    CommandText = 'PORTFORWARDING'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Tourmaline
    Left = 152
    Top = 8
    object PORTFORWARDINGLOCALPORT: TIntegerField
      FieldName = 'LOCALPORT'
    end
    object PORTFORWARDINGREMOTEPORT: TIntegerField
      FieldName = 'REMOTEPORT'
    end
    object PORTFORWARDINGREMOTEIP: TStringField
      FieldName = 'REMOTEIP'
      Size = 15
    end
    object PORTFORWARDINGDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object PORTFORWARDINGACTIVE: TSmallintField
      FieldName = 'ACTIVE'
    end
  end
  object dspPORTFORWARDING: TDataSetProvider
    DataSet = PORTFORWARDING
    Left = 304
    Top = 8
  end
  object USERS: TSQLDataSet
    Active = True
    CommandText = 'USERS'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Tourmaline
    Left = 152
    Top = 104
    object USERSUSERNAME: TStringField
      FieldName = 'USERNAME'
      Required = True
      Size = 50
    end
    object USERSFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object USERSLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object USERSDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object USERSADRESSIP: TStringField
      FieldName = 'ADRESSIP'
      Size = 15
    end
    object USERSACTIVE: TSmallintField
      FieldName = 'ACTIVE'
      Required = True
    end
  end
  object dspBLACKLIST: TDataSetProvider
    DataSet = BLACKLIST
    Left = 304
    Top = 56
  end
  object dspUSERS: TDataSetProvider
    DataSet = USERS
    Left = 304
    Top = 104
  end
  object HTTP: TIdHTTPProxyServer
    Bindings = <>
    DefaultPort = 3128
    OnConnect = HTTPConnect
    CommandHandlers = <>
    ExceptionReply.Code = '500'
    ExceptionReply.Text.Strings = (
      'Unknown Internal Error')
    Greeting.Code = '200'
    HelpReply.Code = '100'
    HelpReply.Text.Strings = (
      'Help follows')
    MaxConnectionReply.Code = '300'
    MaxConnectionReply.Text.Strings = (
      'Too many connections. Try again later.')
    ReplyTexts = <>
    ReplyUnknownCommand.Code = '400'
    OnBeforeCommandHandler = HTTPBeforeCommandHandler
    Left = 24
    Top = 56
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 24
    Top = 104
  end
  object REG: TglRegistry
    CompanyName = 'Icarus.Empire'
    ProjectName = 'Tourmaline'
    Left = 24
    Top = 152
  end
  object BLACKLIST: TSQLDataSet
    Active = True
    CommandText = 'BLACKLIST'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Tourmaline
    Left = 153
    Top = 57
    object BLACKLISTURL: TStringField
      FieldName = 'URL'
      Required = True
      Size = 600
    end
    object BLACKLISTDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 100
    end
    object BLACKLISTACTIVE: TSmallintField
      FieldName = 'ACTIVE'
      Required = True
    end
  end
  object MapPartTCP: TIdMappedPortTCP
    Bindings = <>
    DefaultPort = 0
    MappedPort = 0
    Left = 24
    Top = 200
  end
end
