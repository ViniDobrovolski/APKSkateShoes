unit frmLoginCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, Data.DB, System.permissions,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Edit, FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, System.Actions, FMX.ActnList, FMX.StdActns,
  FMX.MediaLibrary.Actions, IdHashSHA, FMX.DialogService;

type
  TfIniciar = class(TForm)
    LayoutRodape: TLayout;
    Image1: TImage;
    ActionList1: TActionList;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    Image2: TImage;
    Image4: TImage;
    Label3: TLabel;
    EditTelefone: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    EditSenha1: TEdit;
    BtnCadastrar: TButton;
    Label4: TLabel;
    Image5: TImage;
    Label7: TLabel;
    EditLogin: TEdit;
    Label8: TLabel;
    EditSenha: TEdit;
    btnLogin: TButton;
    Image6: TImage;
    Change2: TChangeTabAction;
    Change3: TChangeTabAction;
    Change1: TChangeTabAction;
    EditNome: TEdit;
    EditEmail: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Image1Click(Sender: TObject);

    procedure Image6Click(Sender: TObject);
    procedure BtnCadastrarClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fIniciar: TfIniciar;

implementation

uses
  UDM, frmMenu;

{$R *.fmx}
{$R *.LgXhdpiTb.fmx ANDROID}

function SHA1FromString(const AString: string): string;
var
  SHA1: TIdHashSHA1;
begin
  SHA1 := TIdHashSHA1.Create;
  try
    Result := SHA1.HashStringAsHex(AString);
  finally
    SHA1.Free;
  end;
end;

procedure TfIniciar.BtnCadastrarClick(Sender: TObject);


begin


  DM.FDQueryPessoa.Close;
  DM.FDQueryPessoa.Open();
  if (EditEmail.Text = EmptyStr) or (EditSenha1.Text = EmptyStr) then
    Abort;

  DM.FDQueryPessoa.Append;
  DM.FDQueryPessoaemail.AsString := EditEmail.Text;
  DM.FDQueryPessoasenha.AsString := EditSenha1.Text;
  DM.FDQueryPessoanome.AsString := EditNome.Text;
  DM.FDQueryPessoatelefone.AsString := EditTelefone.Text;


  DM.FDQueryPessoa.Post;
  DM.FDConnection1.CommitRetaining;

  Change1.Execute;
end;


procedure TfIniciar.btnLoginClick(Sender: TObject);

begin

  DM.FDQueryPessoa.Close;
  DM.FDQueryPessoa.ParamByName('pnome').AsString := EditLogin.Text;
  DM.FDQueryPessoa.Open();

  if not(DM.FDQueryPessoa.IsEmpty) and (DM.FDQueryPessoasenha.AsString = EditSenha.Text) then
  begin
    if not Assigned(frmMenuu) then
      Application.CreateForm(TfrmMenuu, frmMenuu);
    frmMenuu.Show;
    fIniciar.release;
    fIniciar:=nil;

  end
  else
  begin
    ShowMessage('Login ou senha n?o confere');
  end;
end;

procedure TfIniciar.Image1Click(Sender: TObject);
begin
  case TabControl1.TabIndex of
    0:
      Change2.Execute;
    1:
      Change3.Execute;

  end;
end;

procedure TfIniciar.Image6Click(Sender: TObject);
begin

  Change1.Execute;

end;



end.
