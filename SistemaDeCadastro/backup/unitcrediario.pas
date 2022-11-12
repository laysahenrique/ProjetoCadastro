unit unitCrediario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  ExtCtrls, unitCadastroPai, SQLDB, DBDateTimePicker;

type

  { TFormCadastroCrediario }

  TFormCadastroCrediario = class(TFormCadastroPai)
    DBDateTimePickerVencimento: TDBDateTimePicker;
    DBDateTimePickerDataCompra: TDBDateTimePicker;
    DBEditAnotacao: TDBEdit;
    DBEditValorDivida: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditId: TDBEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
  private

  public
    function valida: boolean; override;
  end;

var
  FormCadastroCrediario: TFormCadastroCrediario;

implementation

{$R *.lfm}

{ TFormCadastroCrediario }



function TFormCadastroCrediario.valida: boolean;
begin
  Result:=inherited valida;
  if DBEditNome.Text = '' then result:= false;
  if DBEditValorDivida.Text = '' then result:= false;
  //if DBDateTimePickerDataCompra = NULL then result:= false;
  //if DBDateTimePickerVencimento = NULL then result:= false;
end;

end.

