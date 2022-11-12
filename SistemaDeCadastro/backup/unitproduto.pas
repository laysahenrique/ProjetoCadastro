unit unitProduto;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  unitCadastroPai, SQLDB, DBDateTimePicker;

type

  { TFormCadastroProduto }

  TFormCadastroProduto = class(TFormCadastroPai)
    DBDateTimePicker1: TDBDateTimePicker;
    DBDateTimePicker2: TDBDateTimePicker;
    DBEditNome: TDBEdit;
    DBEditFornecedor: TDBEdit;
    DBEditPreco: TDBEdit;
    DBEditEstoque: TDBEdit;
    DBEditId: TDBEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
  private

  public

  end;

var
  FormCadastroProduto: TFormCadastroProduto;

implementation

{$R *.lfm}

function TFormCadastroProduto.valida: boolean;
begin
  Result:=inherited valida;
  if DBEditNome.Text = '' then result:= false;
  if DBEditFornecedor.Text = '' then result:= false;
  if DBEditEstoque.Text = '' then result:= false;
  if DBEditPreco.Text = '' then result:= false;
end;

end.

