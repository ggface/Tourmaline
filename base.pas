unit base;

interface

uses
  SysUtils, Classes, DB, ADODB, glConnect, DBXDataSnap, DBXCommon, DBClient,
  DSConnect, SqlExpr, Dialogs, glTools;

type
  TBases = class(TDataModule)
    SQLConnection1: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    cdsPORTFORWARDING: TClientDataSet;
    dsPORTFORWARDING: TDataSource;
    cdsBLACKLIST: TClientDataSet;
    cdsUSERS: TClientDataSet;
    dsBLACKLIST: TDataSource;
    dsUSERS: TDataSource;
    cdsPORTFORWARDINGLOCALPORT: TIntegerField;
    cdsPORTFORWARDINGREMOTEPORT: TIntegerField;
    cdsPORTFORWARDINGREMOTEIP: TStringField;
    cdsPORTFORWARDINGDESCRIPTION: TStringField;
    cdsPORTFORWARDINGACTIVE: TSmallintField;
    cdsBLACKLISTURL: TStringField;
    cdsBLACKLISTDESCRIPTION: TStringField;
    cdsBLACKLISTACTIVE: TSmallintField;
    cdsUSERSUSERNAME: TStringField;
    cdsUSERSFIRSTNAME: TStringField;
    cdsUSERSLASTNAME: TStringField;
    cdsUSERSDESCRIPTION: TStringField;
    cdsUSERSADRESSIP: TStringField;
    cdsUSERSACTIVE: TSmallintField;
    glTools1: TglTools;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Bases: TBases;

implementation

{$R *.dfm}

function SmartPosAsm(const substr : AnsiString; const s : AnsiString; StartPos : Cardinal) : Integer;
type
  StrRec = packed record
    allocSiz: Longint;
    refCnt: Longint;
    length: Longint;
  end;
const
  skew = sizeof(StrRec);
asm
{     ->EAX     Pointer to substr               }
{       EDX     Pointer to string               }
{     <-EAX     Position of substr in s or 0    }
        TEST    EAX,EAX
        JE      @@noWork

        TEST    EDX,EDX
        JE      @@stringEmpty

        PUSH    EBX
        PUSH    ESI
        PUSH    EDI

        MOV     ESI,EAX                         { Point ESI to substr           }
        MOV     EDI,EDX                         { Point EDI to s                }

        MOV     EAX,ECX
        MOV     ECX,[EDI-skew].StrRec.length    { ECX = Length(s)               }
        ADD     EDI,EAX
        SUB     ECX,EAX

        PUSH    EDI                             { remember s position to calculate index        }

        MOV     EDX,[ESI-skew].StrRec.length    { EDX = Length(substr)          }

        DEC     EDX                             { EDX = Length(substr) - 1              }
        JS      @@fail                          { < 0 ? return 0                        }
        MOV     AL,[ESI]                        { AL = first char of substr             }
        INC     ESI                             { Point ESI to 2'nd char of substr      }

        SUB     ECX,EDX                         { #positions in s to look at    }
                                                { = Length(s) - Length(substr) + 1      }
        JLE     @@fail
@@loop:
        REPNE   SCASB
        JNE     @@fail
        MOV     EBX,ECX                         { save outer loop counter               }
        PUSH    ESI                             { save outer loop substr pointer        }
        PUSH    EDI                             { save outer loop s pointer             }

        MOV     ECX,EDX
        REPE    CMPSB
        POP     EDI                             { restore outer loop s pointer  }
        POP     ESI                             { restore outer loop substr pointer     }
        JE      @@found
        MOV     ECX,EBX                         { restore outer loop counter    }
        JMP     @@loop

@@fail:
        POP     EDX                             { get rid of saved s pointer    }
        XOR     EAX,EAX
        JMP     @@exit

@@stringEmpty:
        XOR     EAX,EAX
        JMP     @@noWork

@@found:
        POP     EDX                             { restore pointer to first char of s    }
        MOV     EAX,EDI                         { EDI points of char after match        }
        SUB     EAX,EDX                         { the difference is the correct index   }
@@exit:
        POP     EDI
        POP     ESI
        POP     EBX
@@noWork:
end; //SmartPosAsm

function cnsSmartPos(const substr : AnsiString; const s : AnsiString; StartPos : Cardinal) : Integer;
begin
  dec(StartPos);
  Result := SmartPosAsm(SubStr,S,StartPos);
  if Result > 0 then Result := Result + StartPos;
end; //cnsSmartPos

procedure TBases.DataModuleCreate(Sender: TObject);
var
  param, host, port: ansistring;
begin
  param := glTools1.GetStartParam;
  if cnsSmartPos('-host:',param, 1) < 1 then
  begin
    host := 'localhost';
    port := '6589';
  end
  else
  begin
    Delete(param,1, 6);
    if cnsSmartPos(':', param, 1) < 1 then
    begin
      host := param;
      port := '6589';
    end
    else
    begin
      host := Copy(param, 1, Pos(':', param) - 1);
      port := Copy(param, Pos(':', param) + 1, 255);
    end;
  end;
  try
    Bases.SQLConnection1.Params.Text := 'DriverUnit=DBXDataSnap' + #10 +
      'HostName=' + host + #10 + 'Port=' + port + #10 +
      'CommunicationProtocol=tcp/ip' + #10 + 'DatasnapContext=datasnap/';
    SQLConnection1.Open;
    cdsPORTFORWARDING.Open;
    cdsBLACKLIST.Open;
    cdsUSERS.Open;
  except
    ShowMessage('Error. Connect failed.');
    exit;
  end;
end;

end.
