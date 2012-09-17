library First;

uses
  SysUtils, Classes, Windows, Forms;

var
  OwnerApp: Integer;

function OnName: Pchar; far;
begin
	Result := 'Sample Plugin';
end;

procedure OnLoad(Owner: Integer; OwnerF: TForm); far
begin
	OwnerAPP := Owner;
end;

procedure OnMusic(OwnerF: TForm);
begin
//
end;

procedure OnPhotos(OwnerF: TForm);
begin
//
end;

procedure OnVideo(OwnerF: TForm);
begin
//
end;

procedure OnPlaylists(OwnerF: TForm);
begin
//
end;

procedure OnThemes(OwnerF: TForm);
begin
//
end;

procedure OnEBooks(OwnerF: TForm);
begin
//
end;

procedure OnRecordings(OwnerF: TForm);
begin
//
end;

procedure OnPodcasts(OwnerF: TForm);
begin
//
end;

procedure OnTags(OwnerF: TForm);
begin
//
end;
       
procedure OnContacts(OwnerF: TForm);
begin
//
end;

procedure OnConnected(OwnerF: TForm);
begin
//
end;

procedure OnDisconnected(OwnerF: TForm);
begin
//
end;

exports
	OnName, OnLoad, OnMusic, OnPhotos, OnVideo, OnPlaylists, OnThemes, OnEBooks, OnRecordings, OnPodcasts, OnTags, OnContacts, OnConnected, OnDisconnected;

begin
//
end.
