object Tourmaline: TTourmaline
  OldCreateOrder = False
  OnCreate = DSServerModuleCreate
  OnDestroy = DSServerModuleDestroy
  Height = 269
  Width = 424
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
  object MapPartTCP: TIdMappedPortTCP
    Bindings = <>
    DefaultPort = 0
    MappedPort = 0
    Left = 24
    Top = 200
  end
end
