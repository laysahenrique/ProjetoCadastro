unit unitCadastroFornecedor;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, StdCtrls,
  DBExtCtrls, unitCadastroPai, PQConnection, SQLDB, DBDateTimePicker, DB,
   fpjson, fphttpclient, jsonparser, opensslsockets, TypInfo;

type

  { TFormCadastroFornecedor }

  TFormCadastroFornecedor = class(TFormCadastroPai)
    ButtonBuscar: TButton;
    DBDateTimePicker1: TDBDateTimePicker;
    DBEditBairro: TDBEdit;
    DBEditCep: TDBEdit;
    DBEditCidade: TDBEdit;
    DBEditId: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditNumero: TDBEdit;
    DBEditReferencia: TDBEdit;
    DBEditCNPJ: TDBEdit;
    DBEditEmail: TDBEdit;
    DBEditRua: TDBEdit;
    DBEditTelefone: TDBEdit;
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText2: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    procedure ButtonBuscarClick(Sender: TObject);
  private

  public

  end;

var
  FormCadastroFornecedor: TFormCadastroFornecedor;

implementation

{$R *.lfm}

{ TFormCadastroFornecedor }

function TFormCadastroFornecedor.valida: boolean;
begin
  Result:=inherited valida;
  if DBEditNome.Text = '' then result:= false;
  if DBEditCNPJ.Text = '' then result:= false;
  if DBEditEmail.Text = '' then result:= false;
  if DBEditTelefone.Text = '' then result:= false;
  if DBEditCep.Text = '' then result := false;
end;


procedure TFormCadastroFornecedor.ButtonBuscarClick(Sender: TObject);
const
   url : string = 'https://viacep.com.br/ws/';
var
   resposta: String;
   vparse : TJSONParser;
   vjson : TJSONArray;
begin
     try
        resposta := TFPHTTPClient.SimpleGet(url + DBEditCep.text + '/json');
        vparse := TJSONParser.Create('[' + resposta + ']');
        vjson := (vparse.Parse as TJSONArray);
        //Memo1.Text:= resposta;
        DBEditCep.text := (vjson[0] as TJSONObject).Get('cep', '');
        DBEditRua.text := (vjson[0] as TJSONObject).Get('logradouro', '');
        DBEditCidade.Text := (vjson[0] as TJSONObject).Get('localidade', '');
        DBEditBairro.Text := (vjson[0] as TJSONObject).Get('bairro', '');
     finally
        FreeAndNil(vparse);
        FreeAndNil(vjson);
     end;
end;

end.

