unit unitCadastroPai;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, PQConnection, SQLDB, DB, Forms, Controls, Graphics,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DBGrids, DBCtrls, Menus, ZDataset,
  ZConnection, unitDat;

type

  { TFormCadastroPai }

  TFormCadastroPai = class(TForm)
    ButtonExcluir: TButton;
    ButtonInserir: TButton;
    ButtonAlterar: TButton;
    ButtonCancelar: TButton;
    ButtonSalvar: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheetListaCadastro: TTabSheet;
    TabSheetCadastrar: TTabSheet;
    ZQuery1: TZQuery;
    procedure ButtonAlterarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure ButtonInserirClick(Sender: TObject);
    procedure ButtonSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public
    function valida: boolean;  virtual;
  end;

var
  FormCadastroPai: TFormCadastroPai;

implementation

{$R *.lfm}

{ TFormCadastroPai }

function TFormCadastroPai.valida: boolean;
begin
  result := true;
end;

procedure TFormCadastroPai.ButtonAlterarClick(Sender: TObject);
begin
    ZQuery1.Edit;
    PageControl1.ActivePage:= TabSheetCadastrar;
end;

procedure TFormCadastroPai.ButtonExcluirClick(Sender: TObject);
begin
  ZQuery1.Delete;
  unitDat.DataModule1.ZConnection1.Commit;
end;

procedure TFormCadastroPai.ButtonInserirClick(Sender: TObject);
begin
   ZQuery1.Append;
   PageControl1.ActivePage:= TabSheetCadastrar;
end;

procedure TFormCadastroPai.ButtonSalvarClick(Sender: TObject);
begin
  if valida = true then
  begin
   ZQuery1.Post;
   unitDat.DataModule1.ZConnection1.Commit;
   PageControl1.ActivePage:= TabSheetListaCadastro;
  end
  else
    ShowMessage('Todos os campos obrigatórios devem ser preenchidos');

end;

procedure TFormCadastroPai.FormCreate(Sender: TObject);
begin
  ZQuery1.Refresh;
end;

procedure TFormCadastroPai.ButtonCancelarClick(Sender: TObject);
begin
    ZQuery1.Cancel;
    PageControl1.ActivePage:= TabSheetListaCadastro;
end;


end.

