unit unitSistemaCadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  unitCadastroFornecedor, unitCadastroCliente, unitCrediario, unitProduto,
  unitCadastroFuncionario;

type

  { TFormSistemaCadastro }

  TFormSistemaCadastro = class(TForm)
    ButtonFornecedor: TButton;
    ButtonFuncionario: TButton;
    ButtonCliente: TButton;
    ButtonProduto: TButton;
    ButtonCrediario: TButton;
    procedure ButtonClienteClick(Sender: TObject);
    procedure ButtonCrediarioClick(Sender: TObject);
    procedure ButtonFornecedorClick(Sender: TObject);
    procedure ButtonFuncionarioClick(Sender: TObject);
    procedure ButtonProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
  end;

var
  FormSistemaCadastro: TFormSistemaCadastro;

implementation

{$R *.lfm}

{ TFormSistemaCadastro }

procedure TFormSistemaCadastro.ButtonFornecedorClick(Sender: TObject);
begin
  FormCadastroFornecedor := TFormCadastroFornecedor.Create(Self);
  FormCadastroFornecedor.ShowModal;
end;

procedure TFormSistemaCadastro.ButtonFuncionarioClick(Sender: TObject);
begin
   FormCadastroCadastroFuncionario := TFormCadastroCadastroFuncionario.Create(Self);
   FormCadastroCadastroFuncionario.ShowModal;
end;

procedure TFormSistemaCadastro.ButtonProdutoClick(Sender: TObject);
begin
    FormCadastroProduto := TFormCadastroProduto.Create(Self);
    FormCadastroProduto.ShowModal;
end;

procedure TFormSistemaCadastro.FormCreate(Sender: TObject);
begin

end;


procedure TFormSistemaCadastro.ButtonClienteClick(Sender: TObject);
begin
  FormCadastroCliente := TFormCadastroCliente.Create(Self);
  FormCadastroCliente.ShowModal;
end;

procedure TFormSistemaCadastro.ButtonCrediarioClick(Sender: TObject);
begin
  FormCadastroCrediario := TFormCadastroCrediario.Create(Self);
  FormCadastroCrediario.ShowModal;
end;

end.

