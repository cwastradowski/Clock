program Clock;



uses
  Forms,
  unitMain in 'unitMain.pas' {frmMain},
  MMDevAPI in '..\..\MPC Common Files\MPCCommonUnits\MMDevAPI.pas',
  MPCUserName in '..\..\MPC Common Files\MPCCommonUnits\MPCUserName.pas',
  unitDialogs in 'unitDialogs.pas',
  MPCABOUT in '..\ObjRepository\MPC About Box\MPCABOUT.pas' {frmAboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
