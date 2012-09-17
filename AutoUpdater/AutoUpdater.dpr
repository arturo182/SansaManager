program AutoUpdater;

uses
  Forms,
  uMain in 'uMain.pas' {fAutoUpdate};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SansaManager Auto-Update';
  Application.CreateForm(TfAutoUpdate, fAutoUpdate);
  Application.Run;
end.
