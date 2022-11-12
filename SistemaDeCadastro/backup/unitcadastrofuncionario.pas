unit unitCadastroFuncionario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  DBCtrls, DBExtCtrls, unitCadastroPai, SQLDB, fpjson, fphttpclient, jsonparser,
  opensslsockets, TypInfo;

type

  { TFormCadastroCadastroFuncionario }

  TFormCadastroCadastroFuncionario = class(TFormCadastroPai)
    ButtonBuscar: TButton;
    DBDateEdit2: TDBDateEdit;
    DBEditCarteira: TDBEdit;
    DBEditBairro: TDBEdit;
    DBEditCep: TDBEdit;
    DBEditCidade: TDBEdit;
    DBEditCPF: TDBEdit;
    DBEditEmail: TDBEdit;
    DBEditId1: TDBEdit;
    DBEditNome: TDBEdit;
    DBEditNumero: TDBEdit;
    DBEditReferencia: TDBEdit;
    DBEditRg: TDBEdit;
    DBEditRua: TDBEdit;
    DBEditTelefone: TDBEdit;
    GroupBox1: TGroupBox;
    StaticText1: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    procedure ButtonBuscarClick(Sender: TObject);
    procedure StaticText19Click(Sender: TObject);
  private
    function valida: boolean; override;

  public

  end;

var
  FormCadastroCadastroFuncionario: TFormCadastroCadastroFuncionario;

implementation

{$R *.lfm}

{ TFormCadastroCadastroFuncionario }

function TFormCadastroCadastroFuncionario.valida: boolean;
begin
  Result:=inherited valida;
  if DBEditNome.Text = '' then result:= false;
  if DBEditCPF.Text = '' then result:= false;
  if DBEditEmail.Text = '' then result:= false;
  if DBEditTelefone.Text = '' then result:= false;
  if DBEditCep.Text = '' then result := false;
  if DBEditRg.Text = '' then result := false;
  if DBEditCarteira.Text = '' then result := false;
end;

procedure TFormCadastroCadastroFuncionario.ButtonBuscarClick(Sender: TObject);
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

procedure TFormCadastroCadastroFuncionario.StaticText19Click(Sender: TObject);
begin

end;

end.

