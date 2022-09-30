unit frmConta;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Ani, FMX.Layouts;

type
  TfrmConta1 = class(TForm)
    rect_toolbar: TRectangle;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    txtEmail: TEdit;
    txtSenha: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    txtNome: TEdit;
    txtTelefone: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    btnVoltar: TButton;
    btnSalvar: TButton;

    procedure FormActive(Sender: TObject);

    procedure btnSalvarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    procedure CarregarCampos;
  end;

var
  frmConta1: TfrmConta1;
  idEdit : integer;

implementation

{$R *.fmx}

uses UDM,frmMenu;

procedure TfrmConta1.FormActive(Sender: TObject);
begin
     CarregarCampos;


end;



 procedure TfrmConta1.btnSalvarClick(Sender: TObject);


begin
  DM.FDQueryPessoa.Append;

  DM.FDQueryEditar.ParamByName('pemail').AsString := txtemail.Text;
  DM.FDQueryEditar.ParamByName('psenha').AsString := txtSenha.Text;
  DM.FDQueryEditar.ParamByName('pnome').AsString := txtNome.Text;
  DM.FDQueryEditar.ParamByName('ptelefone').AsString := txtTelefone.Text;
  DM.FDQueryEditar.ParamByName('pid').AsInteger := idEdit;


  DM.FDQueryEditar.ExecSQL;

  frmConta1.Release;
  frmConta1:=nil;

  Application.CreateForm(TfrmMenuu, frmMenuu);
    frmMenuu.Show;

end;

procedure TfrmConta1.btnVoltarClick(Sender: TObject);
begin
      frmConta1.Release;
      frmConta1:=nil;
      Application.CreateForm(TfrmMenuu, frmMenuu);
      frmMenuu.Show;

end;

procedure TfrmConta1.CarregarCampos;
 begin
 txtNome.Text:= DM.FDQueryPessoanome.AsString;
 txtTelefone.Text:= DM.FDQueryPessoatelefone.AsString;
 txtEmail.Text:= DM.FDQueryPessoaemail.AsString;
 txtSenha.Text:= DM.FDQueryPessoasenha.AsString;
 idEdit := DM.FDQueryPessoaid.AsInteger;
 end;








end.
