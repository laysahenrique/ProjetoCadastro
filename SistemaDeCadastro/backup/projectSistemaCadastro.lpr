program projectSistemaCadastro;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unitSistemaCadastro,
  datetimectrls, unitCadastroFuncionario, unitDat
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TFormSistemaCadastro, FormSistemaCadastro);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.

