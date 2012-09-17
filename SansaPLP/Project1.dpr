program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

var
 input, output: text;
 linia: char;
begin
  if ParamCount > 1 then
  begin
    Assign(input, ParamStr(1));
    Assign(output, ChangeFileExt(ParamStr(1), '.xxx'));
    Reset(input);
    Rewrite(output);

    if ParamStr(2) = 'decode' then
    begin
      repeat
        Read(input, linia);
        if Ord(linia) > 0 then
          Write(output, linia);
      until EOF(input);
    end else
    begin
      repeat
        Read(input, linia);
          Write(output, linia + #0);
      until EOF(input);
    end;

    close(input);
    close(output);

    DeleteFile(ParamStr(1));
    RenameFile(ChangeFileExt(ParamStr(1), '.xxx'), ParamStr(1));
    DeleteFile(ChangeFileExt(ParamStr(1), '.xxx'));
  end else
  begin
    writeln('usage: SansaPLP input.plp encode/decode');
  end;
end.
 